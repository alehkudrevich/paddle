require "test_helper"

class AdjustmentTest < Minitest::Test

  def test_adjustment_list
    adjustments = Paddle::Adjustment.list

    assert_equal Paddle::Collection, adjustments.class
    assert_equal Paddle::Adjustment, adjustments.data.first.class
    assert_equal "credit", adjustments.data.first.action
  end

  def test_adjustment_create
    adjustment = Paddle::Adjustment.create({
      "action": "credit",
      "transaction_id": "txn_01h7e0r43zjgzbcpqs093spymc",
      "reason": "error",
      "items": [
        {
          "type": "full",
          "item_id": "txnitm_01h7e0rc8we655bjx8km2kpyg0"
        }
      ]
    })

    assert_equal Paddle::Adjustment, adjustment.class
    assert_equal "credit", adjustment.action
  end

end
