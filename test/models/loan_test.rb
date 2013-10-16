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
    @delayed_book = loans(:delayed)
    @delayed_book.created_at = Time.now - (Book::LOAN_PERIOD + 1.day)
    @delayed_magazine = loans(:delayed_mag)
    @delayed_magazine.created_at = Time.now - (2.weeks + 1.day)
  end

  test "should fail when the same user request a second equal loan for a book" do
    # No se podrán solicitar dos libros o revistas al mismo tiempo.
    # Se deberá regresar el libro o revista solicitado para que se le permita solicitar uno nuevamente.
    @book = books(:xkcd)
    @user = users(:ana)
    @loan = Loan.new({user_id: @user.id, item_id:@book.id, item_type_id:@book.item_types_id})
    assert @loan.save
    refute @loan.save
  end

  test "should fail when the same user request a second equal loan for a magazine" do
    @magazine = magazines(:two)
    @user = users(:karen)
    @loan = Loan.new({user_id: @user.id, item_id:@magazine.id, item_type_id:@magazine.item_types_id})
    assert @loan.save
    refute @loan.save
  end  

  test "should be a valid loan for a book" do
    # El tiempo de préstamo de un libro es de un mes.
    assert @in_time.in_time?
  end

  test "should be a valid loan for a magazine" do
    # El tiempo de préstamo de una revista es de 2 semanas.
    assert @in_time.in_time?
  end

  test "should not be valid (for a book)" do
    # El tiempo de préstamo de un libro es de un mes.
    refute @delayed_book.in_time?
  end

  test "should not be valid (for a magazine)" do
    # El tiempo de préstamo de un libro es de un mes.
    refute @delayed_magazine.in_time?
  end  

  test "should calculate the number of days delayed (for a book)" do
    # En caso de no entregarlos, la multa se contabiliza a partir del día que debió haber sido entregado
    assert @delayed_book.delayed_days > 0
  end

  test "should calculate the number of days delayed (for a magazine)" do
    assert @delayed_magazine.delayed_days > 0
  end

  test "should calculate the penalty (for a book)" do
    # se pagan $5.00 por cada día de retraso.
    assert @delayed_book.penalty > 0
  end

  test "should calculate the penalty (for a magazine)" do
    # se pagan $5.00 por cada día de retraso.
    assert @delayed_magazine.penalty > 0
  end  
  
  test "should decrement available copies (for a book)" do
    @book = books(:xkcd)
    @user = users(:ana)
    assert_difference('Book.find(@book.id).copies', -1) do
      Loan.create({user_id: @user.id, item_id: @book.id, item_type_id: @book.item_types_id})
    end
  end

  test "should decrement available copies (for a magazine)" do
    @magazine = magazines(:two)
    @user = users(:ana)
    assert_difference('Magazine.find(@magazine.id).copies', -1) do
      Loan.create({user_id: @user.id, item_id: @magazine.id, item_type_id: @magazine.item_types_id})
    end
  end  

  test "should restrict the loan according to stock (for a book)" do
    @unavailable = books(:unavailable)
    @user = users(:ana)
    @loan = Loan.new({user_id: @user.id, item_id:@unavailable.id, item_type_id:@unavailable.item_types_id})
    refute @loan.save
  end

  test "should restrict the loan according to stock (for a magazine)" do
    @unavailable = magazines(:unavailable)
    @user = users(:ana)
    @loan = Loan.new({user_id: @user.id, item_id:@unavailable.id, item_type_id:@unavailable.item_types_id})
    refute @loan.save
  end  
end
