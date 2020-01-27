import UIKit

class RatingsViewController: UIViewController {
    private var viewModel = RatingsListViewModel.create()
    @IBOutlet weak var tableView: UITableView! {
        didSet {
            self.tableView.register(HeaderCell.nib, forCellReuseIdentifier: HeaderCell.reuseIdentifier)
            self.tableView.register(RatingDescriptionCell.nib, forCellReuseIdentifier: RatingDescriptionCell.reuseIdentifier)
            self.tableView.register(CommonCell.nib, forCellReuseIdentifier: CommonCell.reuseIdentifier)
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        viewModel.willRefreshScreenData()
        viewModel.reload = { [weak self] in
            DispatchQueue.main.async {
                self?.tableView.reloadData()
            }
        }
    }
}

// MARK:- UITableViewDataSource methods
extension RatingsViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return viewModel.numberOfSection()
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRows(index: section)
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: RatingDescriptionCell.reuseIdentifier) as? RatingDescriptionCell else {
                return UITableViewCell()
            }
            if let model = viewModel.ratingsDetails {
               cell.loadData(model: model)
            }
            return cell
        case 1:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: CommonCell.reuseIdentifier) as? CommonCell else {
                return UITableViewCell()
            }
            cell.loadData(model: viewModel.jobs[indexPath.row])
            return cell
        default: return UITableViewCell()
        }
    }
}
// MARK:- UITableViewDelegate methods
extension RatingsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // TODO:- Making of Chart Screen
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard let headerCell = tableView.dequeueReusableCell(withIdentifier: HeaderCell.reuseIdentifier) as? HeaderCell else {
            return nil
        }
        switch section {
        case 0:
            headerCell.loadData(model: viewModel.ratingsDetails as AnyObject, section: section)
            return headerCell
        case 1:
            headerCell.loadData(model: viewModel.jobItem as AnyObject, section: section)
            return headerCell
        default: break
            
        }
        return nil
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 70
    }
}

// TODO:- Action Sheet Implementation for section more data

