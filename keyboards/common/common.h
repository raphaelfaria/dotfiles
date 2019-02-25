#pragma once

#include "muse.h"
#include <print.h>

extern keymap_config_t keymap_config;

enum planck_layers {
  _QWERTY,
  _LOWER,
  _RAISE,
  _ADJUST,
  _FUNCTION
};

enum planck_keycodes {
  QWERTY = SAFE_RANGE,
};

enum {
  TD_LPRN_RPRN = 0,
  TD_LCBR_RCBR = 1,
  TD_LBRC_RBRC = 2
};

qk_tap_dance_action_t tap_dance_actions[] = {
  [TD_LPRN_RPRN] = ACTION_TAP_DANCE_DOUBLE(KC_LPRN, KC_RPRN),
  [TD_LCBR_RCBR] = ACTION_TAP_DANCE_DOUBLE(KC_LCBR, KC_RCBR),
  [TD_LBRC_RBRC] = ACTION_TAP_DANCE_DOUBLE(KC_LBRC, KC_RBRC)
};


#define LOWER MO(_LOWER)
#define RAISE MO(_RAISE)
#define FUNC MO(_FUNCTION)
#define SFT_ENT RSFT_T(KC_ENT)

#define CTL_ESC CTL_T(KC_ESC)
#define GUI_L RGUI_T(KC_LEFT)
#define ALT_D RALT_T(KC_DOWN)
#define CTL_U RCTL_T(KC_UP)

#define TD_PRN TD(TD_LPRN_RPRN)
#define TD_CBR TD(TD_LCBR_RCBR)
#define TD_BRC TD(TD_LBRC_RBRC)

#define _________________QWERTY_L1_________________ KC_Q,    KC_W,    KC_E,    KC_R,    KC_T
#define _________________QWERTY_L2_________________ KC_A,    KC_S,    KC_D,    KC_F,    KC_G
#define _________________QWERTY_L3_________________ KC_Z,    KC_X,    KC_C,    KC_V,    KC_B

#define _________________QWERTY_R1_________________ KC_Y,    KC_U,    KC_I,    KC_O,    KC_P
#define _________________QWERTY_R2_________________ KC_H,    KC_J,    KC_K,    KC_L,    KC_SCLN
#define _________________QWERTY_R3_________________ KC_N,    KC_M,    KC_COMM, KC_DOT,  KC_SLSH

#define _________________LOWER_L1__________________ KC_1,    KC_2,    KC_3,    KC_4,    KC_5
#define _________________LOWER_L2__________________ KC_LSFT, KC_LCTL, KC_LALT, KC_LGUI, _______
#define _________________LOWER_L3__________________ _______, _______, _______, _______, _______

#define _________________LOWER_R1__________________ KC_6,    KC_7,    KC_8,    KC_9,    KC_0
#define _________________LOWER_R2__________________ KC_SLSH, KC_4,    KC_5,    KC_6,    KC_MINS
#define _________________LOWER_R3__________________ KC_ASTR, KC_1,    KC_2,    KC_3,    KC_PLUS

#define _________________RAISE_L1__________________ _______, KC_CIRC, KC_PERC, KC_GRV,  _______
#define _________________RAISE_L2__________________ KC_DLR,  KC_HASH, KC_AT,   KC_EXLM, KC_TILD
#define _________________RAISE_L3__________________ _______, KC_PIPE, KC_ASTR, KC_AMPR, _______

#define _________________RAISE_R1__________________ _______, KC_LBRC, KC_RBRC, KC_MINS, KC_PLUS
#define _________________RAISE_R2__________________ KC_LT,   KC_LPRN, KC_RPRN, KC_EQL,  KC_GT
#define _________________RAISE_R3__________________ _______, KC_LCBR, KC_RCBR, KC_UNDS, _______

#define _________________ADJUST_L1_________________ _______, _______, _______, _______, _______
#define _________________ADJUST_L2_________________ _______, KC_HOME, KC_PGUP, KC_PGDN, KC_END
#define _________________ADJUST_L3_________________ _______, LGUI(KC_LEFT), LGUI(KC_UP), LGUI(KC_DOWN), LGUI(KC_RGHT)

#define _________________ADJUST_R1_________________ KC_HOME, KC_PGUP, KC_PGDN, KC_END,  _______
#define _________________ADJUST_R2_________________ KC_LEFT, KC_DOWN, KC_UP,   KC_RGHT, _______
#define _________________ADJUST_R3_________________ LALT(KC_LEFT), LALT(KC_DOWN), LALT(KC_UP), LALT(KC_RGHT), _______

#define _________________FUNC_L1___________________ RESET,   DEBUG,   _______, _______, _______
#define _________________FUNC_L2___________________ _______, _______, _______, _______, _______
#define _________________FUNC_L3___________________ _______, _______, _______, _______, _______

#define _________________FUNC_R1___________________ _______, KC_F7,   KC_F8,   KC_F9,   KC_F10
#define _________________FUNC_R2___________________ _______, KC_F4,   KC_F5,   KC_F6,   KC_F11
#define _________________FUNC_R3___________________ _______, KC_F1,   KC_F2,   KC_F3,   KC_F12
