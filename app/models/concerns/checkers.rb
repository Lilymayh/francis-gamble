class Checkers < ApplicationRecord

def create
	@checkers = Checkers.new(checkers_params)
	@checkers.user_id = current_user.id  # Assuming you have authentication set up

	def index
    @games = Checkers.all
    render layout: false
  end

	if @checkers.save
		# Update the user's balance
		current_user.balance -= @checkers.bet_amount
		current_user.save

		render json: @checkers, status: :created
	else
		render json: @checkers.errors, status: :unprocessable_entity
	end
end

private

def checkers_params
	params.require(:checkers).permit(:board, :bet_amount, :game_over, :winner)
end
end