web_res = 1025
tablet_res = 769
phone_res = 737
current_class = 'web'

set_body_class = ->
  if is_phone_res()
    current_class = 'phone'
  else if is_tablet_res()
    current_class = 'tablet'
  else if is_tablet_landscape_res()
    current_class = 'tablet_landscape'
  else
    current_class = 'web'
  unless $('body').hasClass(current_class)
    remove_classes_from_body()
    $('body').addClass(current_class)

is_phone_res = ->
  $(window).width() <= phone_res

is_tablet_res = ->
  $(window).width() > phone_res && $(window).width() < tablet_res

is_tablet_landscape_res = ->
  $(window).width() >= tablet_res && $(window).width() < web_res

is_web_res = ->
  $(window).width() >= web_res

res_less_than = (custom_res) ->
  $(window).width() < custom_res

is_phone = ->
  $('body').hasClass('phone')

is_tablet = ->
  $('body').hasClass('tablet')

is_tablet_landscape = ->
  $('body').hasClass('tablet_landscape')

is_web = ->
  $('body').hasClass('web')

get_class= -> current_class

set_body_to_phone = ->
  remove_classes_from_body()
  $('body').addClass('phone')

# private

remove_classes_from_body = ->
  $('body').removeClass('phone').removeClass('tablet').removeClass('tablet_landscape').removeClass('web')

@Responsive = { set_body_class,
                res_less_than,
                is_phone,
                is_tablet,
                is_tablet_landscape,
                is_web,
                get_class,
                set_body_to_phone }

$ ->
  Responsive.set_body_class()

$(window).resize ->
  Responsive.set_body_class()
