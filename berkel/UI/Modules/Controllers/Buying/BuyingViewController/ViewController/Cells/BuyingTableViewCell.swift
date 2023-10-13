//
//  BuyingTableViewCell.swift
//  berkel
//
//  Created by Onur Yilmaz on 29.09.2023.
//

import UIKit

protocol BuyingTableViewCellOutputDelegate: AnyObject {
    func cellTapped(uiModel: IBuyingTableViewCellUIModel)
    func addCollectionTapped(uiModel: IBuyingTableViewCellUIModel)
    func addPaymentTapped(uiModel: IBuyingTableViewCellUIModel)

}

class BuyingTableViewCell: BaseTableViewCell {

    // MARK: IBOutlets
    @IBOutlet private weak var lblName: UILabel!
    @IBOutlet private weak var lblPrice: UILabel!
    @IBOutlet private weak var lblKg: UILabel!
    @IBOutlet private weak var lblProduct: UILabel!
    @IBOutlet private weak var lblActive: UILabel!
    @IBOutlet private weak var viewButtons: UIView!
    @IBOutlet private weak var btnBuy: UIButton!
    @IBOutlet private weak var btnPay: UIButton!

    // MARK: Constraints Outlets
    @IBOutlet private weak var constraintViewButtonsHeight: NSLayoutConstraint!

    weak var outputDelegate: BuyingTableViewCellOutputDelegate? = nil

    @IBOutlet private weak var mContentView: ShadowView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        mContentView.roundCornersEachCorner(.allCorners, radius: 8)
    }

    func registerEvents(uiModel: IBuyingTableViewCellUIModel) {

        // Events
        mContentView.onTap { [unowned self] _ in
            self.outputDelegate?.cellTapped(uiModel: uiModel)
        }

        btnBuy.onTap { [unowned self] _ in
            self.outputDelegate?.addCollectionTapped(uiModel: uiModel)
        }

        btnPay.onTap { [unowned self] _ in
            self.outputDelegate?.addPaymentTapped(uiModel: uiModel)
        }
    }

    func configureCellWith(uiModel: IBuyingTableViewCellUIModel) {
        self.registerEvents(uiModel: uiModel)
        self.visibilityButtons(isVisible: uiModel.isActive)
        self.lblActive.roundCornersEachCorner(.allCorners, radius: 6)

        self.lblName.text = uiModel.sellerName
        self.lblProduct.text = uiModel.productName
        self.lblKg.text = "- Kg"
        self.lblPrice.text = uiModel.price

        if uiModel.isActive {
            self.lblName.textColor = .blackColor
            self.lblProduct.textColor = .blackColor
            self.lblKg.textColor = .blackColor
            self.lblPrice.textColor = .blackColor
            self.lblActive.backgroundColor = .systemGreen
        } else {
            self.lblName.textColor = .gray
            self.lblProduct.textColor = .gray
            self.lblKg.textColor = .gray
            self.lblPrice.textColor = .gray
            self.lblActive.backgroundColor = .darkGray
        }
    }

    private func visibilityButtons(isVisible: Bool) {
        constraintViewButtonsHeight.constant = isVisible ? 52 : 0
        constraintViewButtonsHeight.priority = isVisible ? .defaultHigh : .required
        viewButtons.isHidden = !isVisible
    }
}