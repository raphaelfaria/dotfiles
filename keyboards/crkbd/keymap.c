#include QMK_KEYBOARD_H
#include "bootloader.h"
#ifdef PROTOCOL_LUFA
  #include "lufa.h"
  #include "split_util.h"
#endif
#ifdef SSD1306OLED
  #include "ssd1306.h"
#endif

#include "common.h"

extern keymap_config_t keymap_config;

#ifdef RGBLIGHT_ENABLE
//Following line allows macro to read current RGB settings
extern rgblight_config_t rgblight_config;
#endif

extern uint8_t is_master;

enum custom_keycodes {
  BACKLIT,
  RGBRST
};

enum macro_keycodes {
  KC_SAMPLEMACRO,
};

#define KC______ KC_TRNS
#define KC_XXXXX KC_NO
#define KC_LOWER LOWER
#define KC_RAISE RAISE
#define KC_RST   RESET
#define KC_LRST  RGBRST
#define KC_LTOG  RGB_TOG
#define KC_LHUI  RGB_HUI
#define KC_LHUD  RGB_HUD
#define KC_LSAI  RGB_SAI
#define KC_LSAD  RGB_SAD
#define KC_LVAI  RGB_VAI
#define KC_LVAD  RGB_VAD
#define KC_LMOD  RGB_MOD
#define KC_CTLTB CTL_T(KC_TAB)
#define KC_GUIEI GUI_T(KC_LANG2)
#define KC_ALTKN ALT_T(KC_LANG1)

#define ___________QWERTY_L1___________ _________________QWERTY_L1_________________
#define ___________QWERTY_L2___________ _________________QWERTY_L2_________________
#define ___________QWERTY_L3___________ _________________QWERTY_L3_________________

#define ___________QWERTY_R1___________ _________________QWERTY_R1_________________
#define ___________QWERTY_R2___________ _________________QWERTY_R2_________________
#define ___________QWERTY_R3___________ _________________QWERTY_R3_________________

#define ___________LOWER_L1____________ _________________LOWER_L1__________________
#define ___________LOWER_L2____________ _________________LOWER_L2__________________
#define ___________LOWER_L3____________ _________________LOWER_L3__________________

#define ___________LOWER_R1____________ _________________LOWER_R1__________________
#define ___________LOWER_R2____________ _________________LOWER_R2__________________
#define ___________LOWER_R3____________ _________________LOWER_R3__________________

#define ___________RAISE_L1____________ _________________RAISE_L1__________________
#define ___________RAISE_L2____________ _________________RAISE_L2__________________
#define ___________RAISE_L3____________ _________________RAISE_L3__________________

#define ___________RAISE_R1____________ _________________RAISE_R1__________________
#define ___________RAISE_R2____________ _________________RAISE_R2__________________
#define ___________RAISE_R3____________ _________________RAISE_R3__________________

#define ___________ADJUST_L1___________ _________________ADJUST_L1_________________
#define ___________ADJUST_L2___________ _________________ADJUST_L2_________________
#define ___________ADJUST_L3___________ _________________ADJUST_L3_________________

#define ___________ADJUST_R1___________ _________________ADJUST_R1_________________
#define ___________ADJUST_R2___________ _________________ADJUST_R2_________________
#define ___________ADJUST_R3___________ _________________ADJUST_R3_________________


const uint16_t PROGMEM keymaps[][MATRIX_ROWS][MATRIX_COLS] = {
  [_QWERTY] = LAYOUT(
  //,-----------------------------------------.                ,-----------------------------------------.
      KC_TAB,  ___________QWERTY_L1___________,                  ___________QWERTY_R1___________, KC_BSPC,
  //|------+------+------+------+------+------|                |------+------+------+------+------+------|
      CTL_ESC, ___________QWERTY_L2___________,                  ___________QWERTY_R2___________, KC_QUOT,
  //|------+------+------+------+------+------|                |------+------+------+------+------+------|
      KC_LSFT, ___________QWERTY_L3___________,                  ___________QWERTY_R3___________, SFT_ENT,
  //|------+------+------+------+------+------+------|  |------+------+------+------+------+------+------|
                               KC_LGUI, LOWER, KC_SPC,   KC_ENT, RAISE, KC_LALT
                              //`--------------------'  `--------------------'
  ),

  [_LOWER] = LAYOUT(
  //,-----------------------------------------.                ,-----------------------------------------.
      _______, ___________LOWER_L1____________,                  ___________LOWER_R1____________, KC_BSPC,
  //|------+------+------+------+------+------|                |------+------+------+------+------+------|
      _______, ___________LOWER_L2____________,                  ___________LOWER_R2____________, _______,
  //|------+------+------+------+------+------|                |------+------+------+------+------+------|
      FUNC,    ___________LOWER_L3____________,                  ___________LOWER_R3____________, _______,
  //|------+------+------+------+------+------+------|  |------+------+------+------+------+------+------|
                            _______, _______, _______,   _______, _______, _______
                              //`--------------------'  `--------------------'
  ),

  [_RAISE] = LAYOUT(
  //,-----------------------------------------.                ,-----------------------------------------.
      _______, ___________RAISE_L1____________,                  ___________RAISE_R1____________, KC_BSPC,
  //|------+------+------+------+------+------|                |------+------+------+------+------+------|
      _______, ___________RAISE_L2____________,                  ___________RAISE_R2____________, KC_BSLS,
  //|------+------+------+------+------+------|                |------+------+------+------+------+------|
      _______, ___________RAISE_L3____________,                  ___________RAISE_R3____________, _______,
  //|------+------+------+------+------+------+------|  |------+------+------+------+------+------+------|
                            _______, _______, _______,   _______, _______, _______
                              //`--------------------'  `--------------------'
  ),

  [_ADJUST] = LAYOUT(
  //,-----------------------------------------.                ,-----------------------------------------.
      _______, ___________ADJUST_L1___________,                  ___________ADJUST_R1___________, _______,
  //|------+------+------+------+------+------|                |------+------+------+------+------+------|
      _______, ___________ADJUST_L2___________,                  ___________ADJUST_R2___________, _______,
  //|------+------+------+------+------+------|                |------+------+------+------+------+------|
      _______, ___________ADJUST_L3___________,                  ___________ADJUST_R3___________, _______,
  //|------+------+------+------+------+------+------|  |------+------+------+------+------+------+------|
                            _______, _______, _______,   _______, _______, _______
                              //`--------------------'  `--------------------'
  )
};

int RGB_current_mode;

void persistent_default_layer_set(uint16_t default_layer) {
  eeconfig_update_default_layer(default_layer);
  default_layer_set(default_layer);
}

// Setting ADJUST layer RGB back to default
void update_tri_layer_RGB(uint8_t layer1, uint8_t layer2, uint8_t layer3) {
  if (IS_LAYER_ON(layer1) && IS_LAYER_ON(layer2)) {
    layer_on(layer3);
  } else {
    layer_off(layer3);
  }
}

void matrix_init_user(void) {
    #ifdef RGBLIGHT_ENABLE
      RGB_current_mode = rgblight_config.mode;
    #endif
    //SSD1306 OLED init, make sure to add #define SSD1306OLED in config.h
    #ifdef SSD1306OLED
        iota_gfx_init(!has_usb());   // turns on the display
    #endif
}

//SSD1306 OLED update loop, make sure to add #define SSD1306OLED in config.h
#ifdef SSD1306OLED

// When add source files to SRC in rules.mk, you can use functions.
const char *read_layer_state(void);
const char *read_logo(void);
void set_keylog(uint16_t keycode, keyrecord_t *record);
const char *read_keylog(void);
const char *read_keylogs(void);

// const char *read_mode_icon(bool swap);
// const char *read_host_led_state(void);
// void set_timelog(void);
// const char *read_timelog(void);

void matrix_scan_user(void) {
   iota_gfx_task();
}

void matrix_render_user(struct CharacterMatrix *matrix) {
  if (is_master) {
    // If you want to change the display of OLED, you need to change here
    matrix_write_ln(matrix, read_layer_state());
    matrix_write_ln(matrix, read_keylog());
    matrix_write_ln(matrix, read_keylogs());
    //matrix_write_ln(matrix, read_mode_icon(keymap_config.swap_lalt_lgui));
    //matrix_write_ln(matrix, read_host_led_state());
    //matrix_write_ln(matrix, read_timelog());
  } else {
    matrix_write(matrix, read_logo());
  }
}

void matrix_update(struct CharacterMatrix *dest, const struct CharacterMatrix *source) {
  if (memcmp(dest->display, source->display, sizeof(dest->display))) {
    memcpy(dest->display, source->display, sizeof(dest->display));
    dest->dirty = true;
  }
}

void iota_gfx_task_user(void) {
  struct CharacterMatrix matrix;
  matrix_clear(&matrix);
  matrix_render_user(&matrix);
  matrix_update(&display, &matrix);
}
#endif//SSD1306OLED

bool process_record_user(uint16_t keycode, keyrecord_t *record) {
  if (record->event.pressed) {
#ifdef SSD1306OLED
    set_keylog(keycode, record);
#endif
    // set_timelog();
  }

  switch (keycode) {
    case QWERTY:
      if (record->event.pressed) {
        persistent_default_layer_set(1UL<<_QWERTY);
      }
      return false;
      break;
    case LOWER:
      if (record->event.pressed) {
        layer_on(_LOWER);
        update_tri_layer_RGB(_LOWER, _RAISE, _ADJUST);
      } else {
        layer_off(_LOWER);
        update_tri_layer_RGB(_LOWER, _RAISE, _ADJUST);
      }
      return false;
      break;
    case RAISE:
      if (record->event.pressed) {
        layer_on(_RAISE);
        update_tri_layer_RGB(_LOWER, _RAISE, _ADJUST);
      } else {
        layer_off(_RAISE);
        update_tri_layer_RGB(_LOWER, _RAISE, _ADJUST);
      }
      return false;
      break;
    case ADJUST:
        if (record->event.pressed) {
          layer_on(_ADJUST);
        } else {
          layer_off(_ADJUST);
        }
        return false;
        break;
    case RGB_MOD:
      #ifdef RGBLIGHT_ENABLE
        if (record->event.pressed) {
          rgblight_mode(RGB_current_mode);
          rgblight_step();
          RGB_current_mode = rgblight_config.mode;
        }
      #endif
      return false;
      break;
    case RGBRST:
      #ifdef RGBLIGHT_ENABLE
        if (record->event.pressed) {
          eeconfig_update_rgblight_default();
          rgblight_enable();
          RGB_current_mode = rgblight_config.mode;
        }
      #endif
      break;
  }
  return true;
}

