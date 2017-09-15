/* This is a manifest file that'll be compiled into application.js, which will include all the files
 listed below.
 *
 * Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
 * or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
 *
 * It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
 * compiled file. JavaScript code in this file should be added after the last require_* statement.
 *
 * Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
 * about supported directives.
 *
 *= require jquery
 *= require jquery_ujs
 *= require ../jquerybarrating.js
 */

$(document).ready(function() {
  $('[data-modifier=star-rating]').each(function() {
    $(this).barrating('show', {
        theme: 'bars-square',
        showValues: true,
        showSelectedRating: false,
        onSelect: function(v, t, e) {
          $.post('/manager/jury_challenge_rates', {
            jury_challenge_rate: {
              rating: v,
              challenge_rating_criterium_id: $(e.target).parent().closest('.criterium-container').data('criterium-id'),
              team_challenge_membership_id: $(e.target).parent().closest('.criterium-container').data('membership-id')
            }
          }, function(r) {
            criteria = criteria.map(function(c) {
              return c.challenge_rating_criterium_id == r.challenge_rating_criterium_id && c.team_challenge_membership_id == r.team_challenge_membership_id ? r : c
            })
            console.log(criteria)
            if (criteria.filter(function(e) { return e.rating == null }).length <= 0)
              $('#rating-button-container').html("<a href='/manager/challenges'>Terminer l'évaluation</a>")
          }
        )
      }
    })
  })
})
