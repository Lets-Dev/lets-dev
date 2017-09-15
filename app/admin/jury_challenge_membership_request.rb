ActiveAdmin.register JuryChallengeMembershipRequest do
  menu parent: 'Challenges'
  
  permit_params :challenge_id, :user_id, :status

end
