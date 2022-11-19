
import UIKit

class ColorsTableViewController: UIViewController {
    
    var colors: [UIColor] = []
    
    enum Cells {
        static let detailColor =  "ColorCell"
    }
    
    enum Segues {
        static let toDetail  = "toColorsDetailsViewController"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setsRandomColors()
    }
    
    func setsRandomColors() {
        for _ in 0..<50 {
            colors.append(.random())
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destinationViewController = segue.destination as! ColorDetailViewController
        destinationViewController.color = sender as? UIColor
    }
}


extension ColorsTableViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return colors.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: Cells.detailColor) else {
            return UITableViewCell()
        }
        
        cell.backgroundColor = colors[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let color = colors[indexPath.row]
        performSegue(withIdentifier: Segues.toDetail, sender: color)
    }
}

