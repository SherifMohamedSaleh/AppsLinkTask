//
//  MoreViewController.swift
//  AppsLinkTask
//
//  Created by Sherif Abd El-Moniem on 25/11/2021.
//

import UIKit
enum MoreActionsEnum {
    case MyProfile
    case NotificationSettings
    case Geofences
    case Beacons
    case ActiveHours
    case CheckHistory
    case MySchedule
    case ContactUs
    case Requests
    case ChangeLanguage
    case Logout
    func getTitle() -> String {
        switch self {
        case .MyProfile:
            return MyProfileTitle
        case .NotificationSettings:
            return NotificationSettingsTitle
        case .Geofences:
            return GeofencesTitle
        case .Beacons:
            return BeaconsTitle
        case .ActiveHours:
            return ActiveHoursTitle
        case .CheckHistory:
            return CheckHistoryTitle
        case .MySchedule:
            return MyScheduleTitle
        case .ContactUs:
            return ContactUsTitle
        case .Requests:
            return RequestsTitle
        case .ChangeLanguage:
            return ChangeLanguageTitle
        case .Logout:
            return LogoutTitle
        }
    }
    func getImage() -> String {
        switch self {
        case .MyProfile:
            return "myProfileIcon"
        case .NotificationSettings:
            return "notificationSettingsIcon"
        case .Geofences:
            return "GeofencesIcon"
        case .Beacons:
            return "bluetoothIcon"
        case .ActiveHours:
            return "alarmIcon"
        case .CheckHistory:
            return "checkListIcon"
        case .MySchedule:
            return "calendar"
        case .ContactUs:
            return "contactUsIcon"
        case .Requests:
            return "requestIcon"
        case .ChangeLanguage:
            return "languageIcon"
        case .Logout:
            return "logoutIcon"
        }
    }
}

class MoreViewController: UIViewController {
    
    
    var cellIdentifire = "MoreTableViewCell"
    var moreActions :[MoreActionsEnum] = []
    
    @IBOutlet weak var tableView: UITableView!
 
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationBarSetup()
        setup()
    }
    
    func setup () {
        setupTableViewCells()
        let nib = UINib(nibName: cellIdentifire, bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: cellIdentifire)
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    
    func setupTableViewCells () {
        moreActions = [     .MyProfile,
                            .NotificationSettings,
                            .Geofences,
                            .Beacons,
                            .ActiveHours,
                            .CheckHistory,
                            .MySchedule,
                            .ContactUs,
                            .Requests,
                            .ChangeLanguage,
                            .Logout ]
        
    }
    
    
  
    func userPressedMyProfile(){
        let profile = ProfileStoryboardRouter.instantiateProfileViewController()
        self.navigationController?.pushViewController(profile, animated: false)
    }
    
    
    func navigationBarSetup () {
        let logo = UILabel()
        logo.text = "More"
        self.navigationItem.titleView = logo
    }
}
extension MoreViewController : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return moreActions.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifire, for: indexPath) as? MoreTableViewCell {
            cell.setup(text: moreActions[indexPath.row].getTitle(), image: moreActions[indexPath.row].getImage())
            return cell
        }
        return UITableViewCell()
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row < moreActions.count {
            if moreActions[indexPath.row]  == MoreActionsEnum.MyProfile{
                //  navigate to profile screen
                userPressedMyProfile()
            }
        }
    }
}
