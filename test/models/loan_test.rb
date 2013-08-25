require 'test_helper'

class LoanTest < ActiveSupport::TestCase
  should validate_presence_of(:user_id)
  should validate_presence_of(:item_id)
  should validate_presence_of(:item_type_id)
  should validate_numericality_of(:user_id)
  should validate_numericality_of(:item_id)
  should validate_numericality_of(:item_type_id)
  should belong_to(:user)
  should belong_to(:item_type)

  setup do
    @in_time = loans(:first_loan)
    @delayed = loans(:delayed)
    @delayed.created_at = Time.now - 1.month
  end

  test "should fail when the same user request a second equal loan" do
    # No se podrán solicitar dos libros o revistas al mismo tiempo.
    # Se deberá regresar el libro o revista solicitado para que se le permita solicitar uno nuevamente.
    @book = books(:xkcd)
    @user = users(:ana)
    @loan = Loan.new({user_id: @user.id, item_id:@book.id, item_type_id:@book.item_types_id})
    assert @loan.save
    refute @loan.save
  end

  test "should be valid" do
    # El tiempo de préstamo de un libro es de un mes.
    assert @in_time.in_time?
  end

  test "should not be valid" do
    # El tiempo de préstamo de un libro es de un mes.
    refute @delayed.in_time?
  end

  test "should calculate the number of days delayed" do
    # En caso de no entregarlos, la multa se contabiliza a partir del día que debió haber sido entregado
    assert @delayed.delayed_days > 0
  end

  test "should calculate the penalty" do
    # se pagan $5.00 por cada día de retraso.
    assert @delayed.penalty > 0
  end
  
  test "should decrement available copies" do    
    @book = books(:xkcd)
    @user = users(:ana)
    assert_difference('Book.find(@book.id).copies', -1) do
      Loan.create({user_id: @user.id, item_id: @book.id, item_type_id: @book.item_types_id})
    end
  end

  test "should restrict the loan according to stock" do
    flunk 'TODO'
  end
end
