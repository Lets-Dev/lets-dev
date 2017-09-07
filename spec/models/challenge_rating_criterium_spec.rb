require 'spec_helper'

describe ChallengeRatingCriterium do
  it :has_valid_factory do
    expect(FactoryGirl.build(:challenge_rating_criterium)).to be_valid
  end

  describe :validates do
    describe :presence_of do
      it :challenge do
        expect(FactoryGirl.build(:challenge_rating_criterium, challenge: nil)).not_to be_valid
      end
    end
  end
end
