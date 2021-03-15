//
//  AirportSearchView.swift
//  airport-finder
//
//  Created by Ricardo Ramirez on 11/03/21.
//

import UIKit
import CoreLocation

class AirportSearchView: UIViewController {
    
    var presenter: AirportSearchViewToPresenter?
    
    let locationManager = CLLocationManager()
    
    var islocationEnabled = false
    
    let mainStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.alignment = .fill
        stack.distribution = .equalSpacing
        stack.spacing = 10
        return stack
    }()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 32)
        label.text = "Airport finder"
        label.textAlignment = .center
        return label
    }()
    
    let distanceAmountLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 24)
        label.text = "0"
        label.textAlignment = .center
        return label
    }()
    
    let distanceSlider: UISlider = {
        let slider = UISlider()
        slider.addTarget(self, action: #selector(onChangeDistanceSlider(_:)), for: .valueChanged)
        slider.minimumValue = 0.01
        return slider
    }()
    
    let distanceDescriptionLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 24)
        label.text = "Ratio in KM"
        label.textAlignment = .center
        return label
    }()
    
    let searchButton: UIButton = {
        let button = UIButton()
        button.setTitle("Search", for: .normal)
        button.addTarget(self, action: #selector(onTapSearch), for: .touchUpInside)
        button.setTitleColor(.label, for: .normal)
        return button
    }()
    
    let loadingView = LoadingViewController()
    
    override func loadView() {
        super.loadView()
        setupUI()
        setupDelegates()
        activateConstraints()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        locationManager.requestWhenInUseAuthorization()
        self.distanceSlider.value = 0.5
        self.updateDistanceAmountLabel(withSliderValue: 0.5)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        title = "Airport Finder"
    }
    
    func setupUI() {
        view.backgroundColor = .systemBackground
        view.addSubview(mainStack)
        mainStack.addArrangedSubview(titleLabel)
        mainStack.addArrangedSubview(distanceAmountLabel)
        mainStack.addArrangedSubview(distanceSlider)
        mainStack.addArrangedSubview(distanceDescriptionLabel)
        mainStack.addArrangedSubview(searchButton)
    }
    
    func setupDelegates() {
        locationManager.delegate = self
    }
    
    func activateConstraints() {
        mainStack.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            mainStack.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            mainStack.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor),
            mainStack.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor, constant: -20),
            mainStack.heightAnchor.constraint(lessThanOrEqualTo: view.safeAreaLayoutGuide.heightAnchor)
        ])
    }
    
    @objc func onChangeDistanceSlider(_ sender: UISlider) {
        updateDistanceAmountLabel(withSliderValue: sender.value)
    }
    
    @objc func onTapSearch() {
        guard islocationEnabled else {
            present(
                SystemAlertHelper.createInformativeAlert(
                    title: "Error",
                    message: "Can't get location, enable Location at Settings.",
                    buttonTitle: "Ok",
                    completion: nil
                ),
                animated: true,
                completion: nil
            )
            return
        }
        locationManager.requestLocation()
    }
    
    func updateDistanceAmountLabel(withSliderValue value: Float) {
        distanceAmountLabel.text = String(Int(value * 100))
    }
 
}

extension AirportSearchView: CLLocationManagerDelegate {
    
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        switch manager.authorizationStatus {
        case .authorizedWhenInUse:
            islocationEnabled = true
        default:
            islocationEnabled = false
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.first else {
            return
        }
        presenter?.requestAirports(withLocation: location, ratioInKM: Int(distanceSlider.value * 100))
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        present(
            SystemAlertHelper.createInformativeAlert(
                title: "Error",
                message: "Something happens at getting location",
                buttonTitle: "Ok",
                completion: nil
            ),
            animated: true,
            completion: nil
        )
    }
    
}

extension AirportSearchView: AirportSearchPresenterToView {
    func showError(_ error: String) {
        present(
            SystemAlertHelper.createInformativeAlert(
                title: "Error",
                message: error,
                buttonTitle: "Ok",
                completion: nil
            ),
            animated: true,
            completion: nil
        )
    }
    
    func pushVC(_ vc: UIViewController) {
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func showLoadingUI() {
        add(loadingView)
    }
    
    func hideLoadingUI() {
        loadingView.remove()
    }
    
}
