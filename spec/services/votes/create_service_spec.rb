RSpec.describe Votes::CreateService do
  let!(:user) { create(:user) }
  let!(:poll) { create(:poll, user: user) }
  let!(:restaurant) { create(:restaurant, user: user) }
  let!(:voting_process) do
    proc do
      described_class.new(
        user: user,
        poll: poll,
        restaurant: restaurant
      ).call
    end
  end

  context 'successful' do
    let!(:vote) { voting_process.call }

    it 'it creates a vote' do
      expect(vote).to be_a_kind_of(Vote)
      expect(vote.user).to eq user
      expect(vote.poll).to eq poll
      expect(vote.restaurant).to eq restaurant
    end
  end

  context 'failure' do
    let!(:vote) { voting_process.call }
    let!(:failed_vote) { voting_process.call }

    it 'voting the same restaurant with the same person twice should return an error' do
      expect(failed_vote).to have_key(:errors)
      expect(failed_vote[:errors]).to eq ['User has already been taken']
    end
  end
end
