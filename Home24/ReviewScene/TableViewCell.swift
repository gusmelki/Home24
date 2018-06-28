import UIKit

class TableViewCell: UITableViewCell {

  @IBOutlet weak var articleImgView: UIImageView!
  @IBOutlet weak var articleNameLabel: UILabel!
  @IBOutlet weak var likedArticleLabel: UILabel!
  
  override func awakeFromNib() {
        super.awakeFromNib()
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
