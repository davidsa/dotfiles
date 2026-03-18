#include <stdio.h>
#include QMK_KEYBOARD_H

enum sofle_layers {
    _DEFAULTS = 0,
    _QWERTY = 0,
    _SYMBOLS,
    _NAV,
    _RAISE,
    _ADJUST,
    _EX_NAV,
};

enum custom_keycodes {
    KC_QWERTY = SAFE_RANGE,
    KC_SYMBOLS,
    KC_NAV,
    KC_EX_NAV,
    KC_RAISE,
    KC_ADJUST,
    KC_D_MUTE,
    _TABNEXT,
    _TABPREV,
    _TABNEW,
    _TABCLOSE,
};

const uint16_t PROGMEM keymaps[][MATRIX_ROWS][MATRIX_COLS] = {
  [_QWERTY] = LAYOUT(
    //,------------------------------------------------.                    ,---------------------------------------------------.
    KC_GRV,   KC_1,   KC_2,    KC_3,    KC_4,    KC_5,                       KC_6,    KC_7,   KC_8,    KC_9,    KC_0,    KC_MINS,
    //|------+-------+--------+--------+--------+------|                   |--------+-------+--------+--------+--------+---------|
    KC_TAB,  KC_Q,   KC_W,    KC_E,    KC_R,    KC_T,                        KC_Y,    KC_U,   KC_I,    KC_O,    KC_P,    KC_RBRC,
    //|------+-------+--------+--------+--------+------|                   |--------+-------+--------+--------+--------+---------|
    LT(_NAV,KC_ESC),  KC_A,   KC_S,    KC_D,    KC_F,    KC_G,               KC_H,    KC_J,   KC_K,    KC_L,    KC_SCLN, KC_QUOT,
    //|------+-------+--------+--------+--------+------|  ===  |   |  ===  |--------+-------+--------+--------+--------+---------|
    KC_LSFT, KC_Z,   KC_X,    KC_C,    KC_V,    KC_B,  KC_MUTE,  KC_D_MUTE, KC_N,    KC_M,   KC_COMM, KC_DOT,  KC_SLSH, KC_LSFT,
    //|------+-------+--------+--------+--------+------|  ===  |   |  ===  |--------+-------+--------+--------+--------+---------|
                   KC_LCTL, KC_LALT, KC_LGUI, KC_SPC, KC_SYMBOLS, KC_RAISE,  KC_ENT,  KC_BSPC,KC_RALT, KC_RCTL
    //            \--------+--------+--------+---------+-------|   |--------+---------+--------+---------+-------/
  ),
  [_SYMBOLS] = LAYOUT(
    //,------------------------------------------------.                    ,---------------------------------------------------.
    _______,  KC_F1,  KC_F2,   KC_F3,   KC_F4,   KC_F5,                      KC_F6,   KC_F7,   KC_F8,   KC_F9,  KC_F10,  KC_F11,
    //|------+-------+--------+--------+--------+------|                   |--------+-------+--------+--------+--------+---------|
    _______, _______, _______, _______, _______, _______,                    RALT(KC_BSLS), S(KC_QUOT), S(KC_BSLS), _______, _______, KC_LBRC,
    //|------+-------+--------+--------+--------+------|                   |--------+-------+--------+--------+--------+---------|
    _______, _______, _______, _______, _______, _______,                    S(KC_0), KC_QUOT, KC_BSLS, S(KC_LBRC), _______, _______,
    //|------+-------+--------+--------+--------+------|  ===  |   |  ===  |--------+-------+--------+--------+--------+---------|
    _______, _______, _______, _______, _______, _______, _______,  _______, RALT(KC_RBRC), KC_NUBS,  S(KC_NUBS),   _______, _______, _______,
    //|------+-------+--------+--------+--------+------|  ===  |   |  ===  |--------+-------+--------+--------+--------+---------|
                   _______, _______, _______, _______, _______,     _______, _______, _______, _______, _______
    //            \--------+--------+--------+---------+-------|   |--------+---------+--------+---------+-------/
  ),
  [_NAV] = LAYOUT(
    //,------------------------------------------------.                    ,---------------------------------------------------.
    _______, _______, _______, _______, _______, _______,                    _______, _______, _______, _______, _______, _______,
    //|------+-------+--------+--------+--------+------|                   |--------+-------+--------+--------+--------+---------|
    _______, _______, _______, _______, _______, _______,                    _______, _______, _______, _______, _______, _______,
    //|------+-------+--------+--------+--------+------|                   |--------+-------+--------+--------+--------+---------|
    _______, _______, _______, _______, _______, _______,                    KC_LEFT, KC_DOWN, KC_UP, KC_RIGHT, _______, _______,
    //|------+-------+--------+--------+--------+------|  ===  |   |  ===  |--------+-------+--------+--------+--------+---------|
    _______, _______, _______, _______, _______, _______, _______,  _______, _______, _______, _______, _______, _______, _______,
    //|------+-------+--------+--------+--------+------|  ===  |   |  ===  |--------+-------+--------+--------+--------+---------|
                   _______, _______, _______, _______,  KC_EX_NAV,     _______, _______, _______, _______, _______
    //            \--------+--------+--------+---------+-------|   |--------+---------+--------+---------+-------/
  ),
  [_EX_NAV] = LAYOUT(
    //,------------------------------------------------.                    ,---------------------------------------------------.
    _______, _______, _______, _______, _______, _______,                    _______, _______, _______, _______, _______, _______,
    //|------+-------+--------+--------+--------+------|                   |--------+-------+--------+--------+--------+---------|
    _______, _______, _______, _______, _______, _______,                    _______, _______, _______, _______, _______, _______,
    //|------+-------+--------+--------+--------+------|                   |--------+-------+--------+--------+--------+---------|
    _______, _______, _______, _______, _______, _______,                    KC_HOME, _______, _______, KC_END, _______, _______,
    //|------+-------+--------+--------+--------+------|  ===  |   |  ===  |--------+-------+--------+--------+--------+---------|
    _______, _______, _______, _______, _______, _______, _______,  _______, _______, _______, _______, _______, _______, _______,
    //|------+-------+--------+--------+--------+------|  ===  |   |  ===  |--------+-------+--------+--------+--------+---------|
                   _______, _______, _______, _______,  _______,     _______, _______, _______, _______, _______
    //            \--------+--------+--------+---------+-------|   |--------+---------+--------+---------+-------/
  ),
  [_RAISE] = LAYOUT(
    //,------------------------------------------------.                    ,---------------------------------------------------.
    RM_NEXT, _______, _______, _______, _______, _______,                    _______, _______, _______, _______, _______, _______,
    //|------+-------+--------+--------+--------+------|                   |--------+-------+--------+--------+--------+---------|
    _______, _______, _______, KC_MPRV, KC_MPLY, KC_MNXT,                    _______, _______, _______, _______, _______, _______,
    //|------+-------+--------+--------+--------+------|                   |--------+-------+--------+--------+--------+---------|
    _______, _______,_TABCLOSE,_TABPREV,_TABNEXT,_TABNEW,                    _______, _______, _______, _______, _______, _______,
    //|------+-------+--------+--------+--------+------|  ===  |   |  ===  |--------+-------+--------+--------+--------+---------|
    _______, _______, _______, KC_BRID, KC_BRIU, RM_TOGG, _______,  _______, _______, _______, _______, _______, _______, _______,
    //|------+-------+--------+--------+--------+------|  ===  |   |  ===  |--------+-------+--------+--------+--------+---------|
                   _______, _______, _______, _______, _______,     _______, _______, _______, _______, _______
    //            \--------+--------+--------+---------+-------|   |--------+---------+--------+---------+-------/
  ),
  [_ADJUST] = LAYOUT(
    //,------------------------------------------------.                    ,---------------------------------------------------.
    EE_CLR, XXXXXXX, XXXXXXX, XXXXXXX, XXXXXXX, XXXXXXX,                   XXXXXXX, XXXXXXX, XXXXXXX, XXXXXXX, XXXXXXX, XXXXXXX,
    //|------+-------+--------+--------+--------+------|                   |--------+-------+--------+--------+--------+---------|
    QK_BOOT,XXXXXXX,XXXXXXX, XXXXXXX, XXXXXXX,  XXXXXXX,                    XXXXXXX, XXXXXXX, XXXXXXX, XXXXXXX, XXXXXXX, XXXXXXX,
    //|------+-------+--------+--------+--------+------|                   |--------+-------+--------+--------+--------+---------|
    RM_NEXT,XXXXXXX, XXXXXXX, XXXXXXX, XXXXXXX, XXXXXXX,                    XXXXXXX,XXXXXXX,XXXXXXX,XXXXXXX,XXXXXXX, XXXXXXX,
    //|------+-------+--------+--------+--------+------|  ===  |   |  ===  |--------+-------+--------+--------+--------+---------|
    RM_TOGG,XXXXXXX, XXXXXXX, XXXXXXX, XXXXXXX, XXXXXXX,XXXXXXX,   XXXXXXX, XXXXXXX, XXXXXXX, XXXXXXX, XXXXXXX, XXXXXXX, XXXXXXX,
    //|------+-------+--------+--------+--------+------|  ===  |   |  ===  |--------+-------+--------+--------+--------+---------|
                     XXXXXXX, XXXXXXX, XXXXXXX, XXXXXXX, XXXXXXX,     XXXXXXX, XXXXXXX, XXXXXXX, XXXXXXX, XXXXXXX
      //            \--------+--------+--------+---------+-------|   |--------+---------+--------+---------+-------/
  ),
};

bool process_record_user(uint16_t keycode, keyrecord_t *record) {
    switch (keycode) {
        case KC_QWERTY:
            if (record->event.pressed) {
                set_single_persistent_default_layer(_QWERTY);
            }
            return false;
        case KC_SYMBOLS:
            if (record->event.pressed) {
                layer_on(_SYMBOLS);
                update_tri_layer(_SYMBOLS, _RAISE, _ADJUST);
            } else {
                layer_off(_SYMBOLS);
                update_tri_layer(_SYMBOLS, _RAISE, _ADJUST);
            }
            return false;
        case KC_RAISE:
            if (record->event.pressed) {
                layer_on(_RAISE);
                update_tri_layer(_SYMBOLS, _RAISE, _ADJUST);
            } else {
                layer_off(_RAISE);
                update_tri_layer(_SYMBOLS, _RAISE, _ADJUST);
            }
            return false;
        case KC_EX_NAV:
            if (record->event.pressed) {
                layer_on(_EX_NAV);
                update_tri_layer(_SYMBOLS, _RAISE, _ADJUST);
            } else {
                layer_off(_EX_NAV);
                update_tri_layer(_SYMBOLS, _RAISE, _ADJUST);
            }
            return false;
        case KC_ADJUST:
            if (record->event.pressed) {
                layer_on(_ADJUST);
            } else {
                layer_off(_ADJUST);
            }
            return false;
        case KC_D_MUTE:
            if (record->event.pressed) {
                register_mods(mod_config(MOD_MEH));
                register_code(KC_UP);
            } else {
                unregister_mods(mod_config(MOD_MEH));
                unregister_code(KC_UP);
            }
            return false;
        case _TABNEXT:
            if (record->event.pressed) {
                register_code(KC_LCTL);
                register_code(KC_B);
                unregister_code(KC_B);
                unregister_code(KC_LCTL);
            } else {
                register_code(KC_N);
                unregister_code(KC_N);
            }
            return false;
        case _TABPREV:
            if (record->event.pressed) {
                register_code(KC_LCTL);
                register_code(KC_B);
                unregister_code(KC_B);
                unregister_code(KC_LCTL);
            } else {
                register_code(KC_P);
                unregister_code(KC_P);
            }
            return false;
        case _TABNEW:
            if (record->event.pressed) {
                register_code(KC_LCTL);
                register_code(KC_B);
                unregister_code(KC_B);
                unregister_code(KC_LCTL);
            } else {
                register_code(KC_C);
                unregister_code(KC_C);
            }
            return false;
        case _TABCLOSE:
            if (record->event.pressed) {
                register_code(KC_LCTL);
                register_code(KC_B);
                unregister_code(KC_B);
                unregister_code(KC_LCTL);
            } else {
                register_code(KC_X);
                unregister_code(KC_X);
            }
            return false;
    }
    return true;
}

#ifdef ENCODER_ENABLE


bool encoder_update_user(uint8_t index, bool clockwise) {
    if (index == 0) {
        if (clockwise) {
            tap_code(KC_VOLU);
        } else {
            tap_code(KC_VOLD);
        }
    } else if (index == 1) {
        if (clockwise) {
            tap_code(KC_BRIU);
        } else {
            tap_code(KC_BRID);
        }
    }
    return false;
}

#endif

bool rgb_matrix_indicators_advanced_user(uint8_t led_min, uint8_t led_max) {
    if (get_highest_layer(layer_state) > 0) {
        uint8_t layer = get_highest_layer(layer_state);

        for (uint8_t row = 0; row < MATRIX_ROWS; ++row) {
            for (uint8_t col = 0; col < MATRIX_COLS; ++col) {
                uint8_t index = g_led_config.matrix_co[row][col];

                if (index >= led_min && index < led_max && index != NO_LED ) {
                    uint16_t keycode = keymap_key_to_keycode(layer, (keypos_t){col,row});

                    if ( keycode == KC_MNXT || keycode == KC_MPLY || keycode == KC_MPRV) {
                        // Media keys
                        rgb_matrix_set_color(index, RGB_GREEN);
                    } else if ( keycode == _TABCLOSE || keycode == _TABPREV || keycode == _TABNEXT || keycode == _TABNEW) {
                        // TMUX keys
                        rgb_matrix_set_color(index, RGB_ORANGE);
                    } else if ( keycode == KC_BRID || keycode == KC_BRIU) {
                        // Brightness keys
                        rgb_matrix_set_color(index, RGB_YELLOW);
                    } else if ( keycode == RM_TOGG) {
                        rgb_matrix_set_color(index, RGB_RED);
                    } else if (keycode> KC_TRNS) {
                        if(layer == _SYMBOLS){
                            rgb_matrix_set_color(index, RGB_PURPLE);
                        } else if(layer == _NAV){
                            rgb_matrix_set_color(index, RGB_PINK);
                        } else if(layer == _EX_NAV){
                            rgb_matrix_set_color(index, RGB_ORANGE);
                        }
                    }
                }
            }
        }
    }
    return false;
}

void matrix_init_user(void){
    rgb_matrix_mode(RGB_MATRIX_GRADIENT_LEFT_RIGHT);
}

