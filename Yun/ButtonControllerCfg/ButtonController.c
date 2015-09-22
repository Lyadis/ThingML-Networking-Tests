/*****************************************************
 *      THIS IS A GENERATED FILE. DO NOT EDIT.
 *        Implementation for Thing ButtonController
 *  Generated from ThingML (http://www.thingml.org)
 *****************************************************/

#include "ButtonController.h"

/*****************************************************************************
 * Implementation for type : ButtonController
 *****************************************************************************/

// Declaration of prototypes:
void ButtonController_LEDControllerChart_OnExit(int state, struct ButtonController_Instance *_instance);
void ButtonController_send_LEDport_LEDON(struct ButtonController_Instance *_instance);
void ButtonController_send_LEDport_LEDOFF(struct ButtonController_Instance *_instance);
void ButtonController_send_LEDport_LEDControllerReady(struct ButtonController_Instance *_instance);
void ButtonController_send_WS_LEDON(struct ButtonController_Instance *_instance);
void ButtonController_send_WS_LEDOFF(struct ButtonController_Instance *_instance);
void ButtonController_send_WS_LEDControllerReady(struct ButtonController_Instance *_instance);
// Declaration of functions:

// On Entry Actions:
void ButtonController_LEDControllerChart_OnEntry(int state, struct ButtonController_Instance *_instance) {
switch(state) {
case BUTTONCONTROLLER_LEDCONTROLLERCHART_STATE:
_instance->ButtonController_LEDControllerChart_State = BUTTONCONTROLLER_LEDCONTROLLERCHART_INIT_STATE;
ButtonController_LEDControllerChart_OnEntry(_instance->ButtonController_LEDControllerChart_State, _instance);
break;
case BUTTONCONTROLLER_LEDCONTROLLERCHART_INIT_STATE:
printf("[CPU] Init\n");
break;
case BUTTONCONTROLLER_LEDCONTROLLERCHART_RUNNING_STATE:
break;
default: break;
}
}

// On Exit Actions:
void ButtonController_LEDControllerChart_OnExit(int state, struct ButtonController_Instance *_instance) {
switch(state) {
case BUTTONCONTROLLER_LEDCONTROLLERCHART_STATE:
ButtonController_LEDControllerChart_OnExit(_instance->ButtonController_LEDControllerChart_State, _instance);
break;
case BUTTONCONTROLLER_LEDCONTROLLERCHART_INIT_STATE:
break;
case BUTTONCONTROLLER_LEDCONTROLLERCHART_RUNNING_STATE:
break;
default: break;
}
}

// Event Handlers for incoming messages:
void ButtonController_handle_LEDport_LEDON(struct ButtonController_Instance *_instance) {
uint8_t ButtonController_LEDControllerChart_State_event_consumed = 0;
if (_instance->ButtonController_LEDControllerChart_State == BUTTONCONTROLLER_LEDCONTROLLERCHART_RUNNING_STATE) {
if (ButtonController_LEDControllerChart_State_event_consumed == 0 && 1) {
ButtonController_send_LEDport_LEDON(_instance);
ButtonController_send_WS_LEDON(_instance);
printf("[CPU] LEDON\n");
ButtonController_LEDControllerChart_State_event_consumed = 1;
}
}
}
void ButtonController_handle_LEDport_LEDOFF(struct ButtonController_Instance *_instance) {
uint8_t ButtonController_LEDControllerChart_State_event_consumed = 0;
if (_instance->ButtonController_LEDControllerChart_State == BUTTONCONTROLLER_LEDCONTROLLERCHART_RUNNING_STATE) {
if (ButtonController_LEDControllerChart_State_event_consumed == 0 && 1) {
ButtonController_send_LEDport_LEDOFF(_instance);
ButtonController_send_WS_LEDOFF(_instance);
printf("[CPU] LEDOFF\n");
ButtonController_LEDControllerChart_State_event_consumed = 1;
}
}
}
void ButtonController_handle_WS_LEDON(struct ButtonController_Instance *_instance) {
uint8_t ButtonController_LEDControllerChart_State_event_consumed = 0;
if (_instance->ButtonController_LEDControllerChart_State == BUTTONCONTROLLER_LEDCONTROLLERCHART_RUNNING_STATE) {
if (ButtonController_LEDControllerChart_State_event_consumed == 0 && 1) {
ButtonController_send_LEDport_LEDON(_instance);
printf("[CPU] WS LEDON\n");
ButtonController_LEDControllerChart_State_event_consumed = 1;
}
}
}
void ButtonController_handle_WS_LEDOFF(struct ButtonController_Instance *_instance) {
uint8_t ButtonController_LEDControllerChart_State_event_consumed = 0;
if (_instance->ButtonController_LEDControllerChart_State == BUTTONCONTROLLER_LEDCONTROLLERCHART_RUNNING_STATE) {
if (ButtonController_LEDControllerChart_State_event_consumed == 0 && 1) {
ButtonController_send_LEDport_LEDOFF(_instance);
printf("[CPU] WS LEDOFF\n");
ButtonController_LEDControllerChart_State_event_consumed = 1;
}
}
}
void ButtonController_handle_empty_event(struct ButtonController_Instance *_instance) {
if (_instance->ButtonController_LEDControllerChart_State == BUTTONCONTROLLER_LEDCONTROLLERCHART_INIT_STATE) {
if (1) {
ButtonController_LEDControllerChart_OnExit(BUTTONCONTROLLER_LEDCONTROLLERCHART_INIT_STATE, _instance);
_instance->ButtonController_LEDControllerChart_State = BUTTONCONTROLLER_LEDCONTROLLERCHART_RUNNING_STATE;
ButtonController_LEDControllerChart_OnEntry(BUTTONCONTROLLER_LEDCONTROLLERCHART_RUNNING_STATE, _instance);
}
}
}

// Observers for outgoing messages:
void (*external_ButtonController_send_LEDport_LEDON_listener)(struct ButtonController_Instance *)= 0x0;
void register_external_ButtonController_send_LEDport_LEDON_listener(void (*_listener)(struct ButtonController_Instance *)){
external_ButtonController_send_LEDport_LEDON_listener = _listener;
}
void (*ButtonController_send_LEDport_LEDON_listener)(struct ButtonController_Instance *)= 0x0;
void register_ButtonController_send_LEDport_LEDON_listener(void (*_listener)(struct ButtonController_Instance *)){
ButtonController_send_LEDport_LEDON_listener = _listener;
}
void ButtonController_send_LEDport_LEDON(struct ButtonController_Instance *_instance){
if (ButtonController_send_LEDport_LEDON_listener != 0x0) ButtonController_send_LEDport_LEDON_listener(_instance);
if (external_ButtonController_send_LEDport_LEDON_listener != 0x0) external_ButtonController_send_LEDport_LEDON_listener(_instance);
;
}
void (*external_ButtonController_send_LEDport_LEDOFF_listener)(struct ButtonController_Instance *)= 0x0;
void register_external_ButtonController_send_LEDport_LEDOFF_listener(void (*_listener)(struct ButtonController_Instance *)){
external_ButtonController_send_LEDport_LEDOFF_listener = _listener;
}
void (*ButtonController_send_LEDport_LEDOFF_listener)(struct ButtonController_Instance *)= 0x0;
void register_ButtonController_send_LEDport_LEDOFF_listener(void (*_listener)(struct ButtonController_Instance *)){
ButtonController_send_LEDport_LEDOFF_listener = _listener;
}
void ButtonController_send_LEDport_LEDOFF(struct ButtonController_Instance *_instance){
if (ButtonController_send_LEDport_LEDOFF_listener != 0x0) ButtonController_send_LEDport_LEDOFF_listener(_instance);
if (external_ButtonController_send_LEDport_LEDOFF_listener != 0x0) external_ButtonController_send_LEDport_LEDOFF_listener(_instance);
;
}
void (*external_ButtonController_send_LEDport_LEDControllerReady_listener)(struct ButtonController_Instance *)= 0x0;
void register_external_ButtonController_send_LEDport_LEDControllerReady_listener(void (*_listener)(struct ButtonController_Instance *)){
external_ButtonController_send_LEDport_LEDControllerReady_listener = _listener;
}
void (*ButtonController_send_LEDport_LEDControllerReady_listener)(struct ButtonController_Instance *)= 0x0;
void register_ButtonController_send_LEDport_LEDControllerReady_listener(void (*_listener)(struct ButtonController_Instance *)){
ButtonController_send_LEDport_LEDControllerReady_listener = _listener;
}
void ButtonController_send_LEDport_LEDControllerReady(struct ButtonController_Instance *_instance){
if (ButtonController_send_LEDport_LEDControllerReady_listener != 0x0) ButtonController_send_LEDport_LEDControllerReady_listener(_instance);
if (external_ButtonController_send_LEDport_LEDControllerReady_listener != 0x0) external_ButtonController_send_LEDport_LEDControllerReady_listener(_instance);
;
}
void (*external_ButtonController_send_WS_LEDON_listener)(struct ButtonController_Instance *)= 0x0;
void register_external_ButtonController_send_WS_LEDON_listener(void (*_listener)(struct ButtonController_Instance *)){
external_ButtonController_send_WS_LEDON_listener = _listener;
}
void (*ButtonController_send_WS_LEDON_listener)(struct ButtonController_Instance *)= 0x0;
void register_ButtonController_send_WS_LEDON_listener(void (*_listener)(struct ButtonController_Instance *)){
ButtonController_send_WS_LEDON_listener = _listener;
}
void ButtonController_send_WS_LEDON(struct ButtonController_Instance *_instance){
if (ButtonController_send_WS_LEDON_listener != 0x0) ButtonController_send_WS_LEDON_listener(_instance);
if (external_ButtonController_send_WS_LEDON_listener != 0x0) external_ButtonController_send_WS_LEDON_listener(_instance);
;
}
void (*external_ButtonController_send_WS_LEDOFF_listener)(struct ButtonController_Instance *)= 0x0;
void register_external_ButtonController_send_WS_LEDOFF_listener(void (*_listener)(struct ButtonController_Instance *)){
external_ButtonController_send_WS_LEDOFF_listener = _listener;
}
void (*ButtonController_send_WS_LEDOFF_listener)(struct ButtonController_Instance *)= 0x0;
void register_ButtonController_send_WS_LEDOFF_listener(void (*_listener)(struct ButtonController_Instance *)){
ButtonController_send_WS_LEDOFF_listener = _listener;
}
void ButtonController_send_WS_LEDOFF(struct ButtonController_Instance *_instance){
if (ButtonController_send_WS_LEDOFF_listener != 0x0) ButtonController_send_WS_LEDOFF_listener(_instance);
if (external_ButtonController_send_WS_LEDOFF_listener != 0x0) external_ButtonController_send_WS_LEDOFF_listener(_instance);
;
}
void (*external_ButtonController_send_WS_LEDControllerReady_listener)(struct ButtonController_Instance *)= 0x0;
void register_external_ButtonController_send_WS_LEDControllerReady_listener(void (*_listener)(struct ButtonController_Instance *)){
external_ButtonController_send_WS_LEDControllerReady_listener = _listener;
}
void (*ButtonController_send_WS_LEDControllerReady_listener)(struct ButtonController_Instance *)= 0x0;
void register_ButtonController_send_WS_LEDControllerReady_listener(void (*_listener)(struct ButtonController_Instance *)){
ButtonController_send_WS_LEDControllerReady_listener = _listener;
}
void ButtonController_send_WS_LEDControllerReady(struct ButtonController_Instance *_instance){
if (ButtonController_send_WS_LEDControllerReady_listener != 0x0) ButtonController_send_WS_LEDControllerReady_listener(_instance);
if (external_ButtonController_send_WS_LEDControllerReady_listener != 0x0) external_ButtonController_send_WS_LEDControllerReady_listener(_instance);
;
}



