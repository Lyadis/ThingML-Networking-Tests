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
void ButtonController_send_Bridge_GreenON(struct ButtonController_Instance *_instance);
void ButtonController_send_Bridge_GreenOFF(struct ButtonController_Instance *_instance);
void ButtonController_send_Bridge_BlueON(struct ButtonController_Instance *_instance);
void ButtonController_send_Bridge_BlueOFF(struct ButtonController_Instance *_instance);
void ButtonController_send_WS_GreenON(struct ButtonController_Instance *_instance);
void ButtonController_send_WS_GreenOFF(struct ButtonController_Instance *_instance);
void ButtonController_send_WS_BlueON(struct ButtonController_Instance *_instance);
void ButtonController_send_WS_BlueOFF(struct ButtonController_Instance *_instance);
void ButtonController_send_WS_UnoON(struct ButtonController_Instance *_instance);
void ButtonController_send_WS_UnoOFF(struct ButtonController_Instance *_instance);
void ButtonController_send_WS_DueON(struct ButtonController_Instance *_instance);
void ButtonController_send_WS_DueOFF(struct ButtonController_Instance *_instance);
void ButtonController_send_Green_Useless(struct ButtonController_Instance *_instance);
void ButtonController_send_Blue_Useless(struct ButtonController_Instance *_instance);
void ButtonController_send_Uno_UnoON(struct ButtonController_Instance *_instance);
void ButtonController_send_Uno_UnoOFF(struct ButtonController_Instance *_instance);
void ButtonController_send_Uno_DueON(struct ButtonController_Instance *_instance);
void ButtonController_send_Uno_DueOFF(struct ButtonController_Instance *_instance);
void ButtonController_send_Due_UnoON(struct ButtonController_Instance *_instance);
void ButtonController_send_Due_UnoOFF(struct ButtonController_Instance *_instance);
void ButtonController_send_Due_DueON(struct ButtonController_Instance *_instance);
void ButtonController_send_Due_DueOFF(struct ButtonController_Instance *_instance);
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
void ButtonController_handle_Green_DueOFF(struct ButtonController_Instance *_instance) {
uint8_t ButtonController_LEDControllerChart_State_event_consumed = 0;
if (_instance->ButtonController_LEDControllerChart_State == BUTTONCONTROLLER_LEDCONTROLLERCHART_RUNNING_STATE) {
if (ButtonController_LEDControllerChart_State_event_consumed == 0 && 1) {
ButtonController_send_Bridge_GreenOFF(_instance);
ButtonController_send_WS_GreenOFF(_instance);
printf("[CPU] GreenOFF\n");
ButtonController_LEDControllerChart_State_event_consumed = 1;
}
}
}
void ButtonController_handle_Green_UnoOFF(struct ButtonController_Instance *_instance) {
uint8_t ButtonController_LEDControllerChart_State_event_consumed = 0;
if (_instance->ButtonController_LEDControllerChart_State == BUTTONCONTROLLER_LEDCONTROLLERCHART_RUNNING_STATE) {
if (ButtonController_LEDControllerChart_State_event_consumed == 0 && 1) {
ButtonController_send_Bridge_GreenOFF(_instance);
ButtonController_send_WS_GreenOFF(_instance);
printf("[CPU] GreenOFF\n");
ButtonController_LEDControllerChart_State_event_consumed = 1;
}
}
}
void ButtonController_handle_Green_UnoON(struct ButtonController_Instance *_instance) {
uint8_t ButtonController_LEDControllerChart_State_event_consumed = 0;
if (_instance->ButtonController_LEDControllerChart_State == BUTTONCONTROLLER_LEDCONTROLLERCHART_RUNNING_STATE) {
if (ButtonController_LEDControllerChart_State_event_consumed == 0 && 1) {
ButtonController_send_Bridge_GreenON(_instance);
ButtonController_send_WS_GreenON(_instance);
printf("[CPU] GreenON\n");
ButtonController_LEDControllerChart_State_event_consumed = 1;
}
}
}
void ButtonController_handle_Green_DueON(struct ButtonController_Instance *_instance) {
uint8_t ButtonController_LEDControllerChart_State_event_consumed = 0;
if (_instance->ButtonController_LEDControllerChart_State == BUTTONCONTROLLER_LEDCONTROLLERCHART_RUNNING_STATE) {
if (ButtonController_LEDControllerChart_State_event_consumed == 0 && 1) {
ButtonController_send_Bridge_GreenON(_instance);
ButtonController_send_WS_GreenON(_instance);
printf("[CPU] GreenON\n");
ButtonController_LEDControllerChart_State_event_consumed = 1;
}
}
}
void ButtonController_handle_Bridge_DueOFF(struct ButtonController_Instance *_instance) {
uint8_t ButtonController_LEDControllerChart_State_event_consumed = 0;
if (_instance->ButtonController_LEDControllerChart_State == BUTTONCONTROLLER_LEDCONTROLLERCHART_RUNNING_STATE) {
if (ButtonController_LEDControllerChart_State_event_consumed == 0 && 1) {
ButtonController_send_Due_DueOFF(_instance);
ButtonController_send_WS_DueOFF(_instance);
printf("[CPU] DueOFF\n");
ButtonController_LEDControllerChart_State_event_consumed = 1;
}
}
}
void ButtonController_handle_Bridge_UnoOFF(struct ButtonController_Instance *_instance) {
uint8_t ButtonController_LEDControllerChart_State_event_consumed = 0;
if (_instance->ButtonController_LEDControllerChart_State == BUTTONCONTROLLER_LEDCONTROLLERCHART_RUNNING_STATE) {
if (ButtonController_LEDControllerChart_State_event_consumed == 0 && 1) {
ButtonController_send_Uno_UnoOFF(_instance);
ButtonController_send_WS_UnoOFF(_instance);
printf("[CPU] UnoOFF\n");
ButtonController_LEDControllerChart_State_event_consumed = 1;
}
}
}
void ButtonController_handle_Bridge_UnoON(struct ButtonController_Instance *_instance) {
uint8_t ButtonController_LEDControllerChart_State_event_consumed = 0;
if (_instance->ButtonController_LEDControllerChart_State == BUTTONCONTROLLER_LEDCONTROLLERCHART_RUNNING_STATE) {
if (ButtonController_LEDControllerChart_State_event_consumed == 0 && 1) {
ButtonController_send_Uno_UnoON(_instance);
ButtonController_send_WS_UnoON(_instance);
printf("[CPU] UnoON\n");
ButtonController_LEDControllerChart_State_event_consumed = 1;
}
}
}
void ButtonController_handle_Bridge_DueON(struct ButtonController_Instance *_instance) {
uint8_t ButtonController_LEDControllerChart_State_event_consumed = 0;
if (_instance->ButtonController_LEDControllerChart_State == BUTTONCONTROLLER_LEDCONTROLLERCHART_RUNNING_STATE) {
if (ButtonController_LEDControllerChart_State_event_consumed == 0 && 1) {
ButtonController_send_Due_DueON(_instance);
ButtonController_send_WS_DueON(_instance);
printf("[CPU] DueON\n");
ButtonController_LEDControllerChart_State_event_consumed = 1;
}
}
}
void ButtonController_handle_WS_DueOFF(struct ButtonController_Instance *_instance) {
uint8_t ButtonController_LEDControllerChart_State_event_consumed = 0;
if (_instance->ButtonController_LEDControllerChart_State == BUTTONCONTROLLER_LEDCONTROLLERCHART_RUNNING_STATE) {
if (ButtonController_LEDControllerChart_State_event_consumed == 0 && 1) {
ButtonController_send_Due_DueOFF(_instance);
ButtonController_send_WS_DueOFF(_instance);
printf("[CPU] DueOFF\n");
ButtonController_LEDControllerChart_State_event_consumed = 1;
}
}
}
void ButtonController_handle_WS_connect(struct ButtonController_Instance *_instance, uint16_t p1, uint16_t p2) {
uint8_t ButtonController_LEDControllerChart_State_event_consumed = 0;
if (_instance->ButtonController_LEDControllerChart_State == BUTTONCONTROLLER_LEDCONTROLLERCHART_RUNNING_STATE) {
if (ButtonController_LEDControllerChart_State_event_consumed == 0 && 1) {
dynButtonControllerCfg_dyn_connect(p1, p2);
printf("[CPU] connect(%i, %i)\n", p1, p2);
ButtonController_LEDControllerChart_State_event_consumed = 1;
}
}
}
void ButtonController_handle_WS_UnoOFF(struct ButtonController_Instance *_instance) {
uint8_t ButtonController_LEDControllerChart_State_event_consumed = 0;
if (_instance->ButtonController_LEDControllerChart_State == BUTTONCONTROLLER_LEDCONTROLLERCHART_RUNNING_STATE) {
if (ButtonController_LEDControllerChart_State_event_consumed == 0 && 1) {
ButtonController_send_Uno_UnoOFF(_instance);
ButtonController_send_WS_UnoOFF(_instance);
printf("[CPU] UnoOFF\n");
ButtonController_LEDControllerChart_State_event_consumed = 1;
}
}
}
void ButtonController_handle_WS_UnoON(struct ButtonController_Instance *_instance) {
uint8_t ButtonController_LEDControllerChart_State_event_consumed = 0;
if (_instance->ButtonController_LEDControllerChart_State == BUTTONCONTROLLER_LEDCONTROLLERCHART_RUNNING_STATE) {
if (ButtonController_LEDControllerChart_State_event_consumed == 0 && 1) {
ButtonController_send_Uno_UnoON(_instance);
ButtonController_send_WS_UnoON(_instance);
printf("[CPU] UnoON\n");
ButtonController_LEDControllerChart_State_event_consumed = 1;
}
}
}
void ButtonController_handle_WS_deconnect(struct ButtonController_Instance *_instance, uint16_t p1, uint16_t p2) {
uint8_t ButtonController_LEDControllerChart_State_event_consumed = 0;
if (_instance->ButtonController_LEDControllerChart_State == BUTTONCONTROLLER_LEDCONTROLLERCHART_RUNNING_STATE) {
if (ButtonController_LEDControllerChart_State_event_consumed == 0 && 1) {
dynButtonControllerCfg_dyn_deconnect(p1, p2);
printf("[CPU] deconnect(%i, %i)\n", p1, p2);
ButtonController_LEDControllerChart_State_event_consumed = 1;
}
}
}
void ButtonController_handle_WS_DueON(struct ButtonController_Instance *_instance) {
uint8_t ButtonController_LEDControllerChart_State_event_consumed = 0;
if (_instance->ButtonController_LEDControllerChart_State == BUTTONCONTROLLER_LEDCONTROLLERCHART_RUNNING_STATE) {
if (ButtonController_LEDControllerChart_State_event_consumed == 0 && 1) {
ButtonController_send_Due_DueON(_instance);
ButtonController_send_WS_DueON(_instance);
printf("[CPU] DueON\n");
ButtonController_LEDControllerChart_State_event_consumed = 1;
}
}
}
void ButtonController_handle_Blue_DueOFF(struct ButtonController_Instance *_instance) {
uint8_t ButtonController_LEDControllerChart_State_event_consumed = 0;
if (_instance->ButtonController_LEDControllerChart_State == BUTTONCONTROLLER_LEDCONTROLLERCHART_RUNNING_STATE) {
if (ButtonController_LEDControllerChart_State_event_consumed == 0 && 1) {
ButtonController_send_Bridge_BlueOFF(_instance);
ButtonController_send_WS_BlueOFF(_instance);
printf("[CPU] BlueOFF\n");
ButtonController_LEDControllerChart_State_event_consumed = 1;
}
}
}
void ButtonController_handle_Blue_UnoOFF(struct ButtonController_Instance *_instance) {
uint8_t ButtonController_LEDControllerChart_State_event_consumed = 0;
if (_instance->ButtonController_LEDControllerChart_State == BUTTONCONTROLLER_LEDCONTROLLERCHART_RUNNING_STATE) {
if (ButtonController_LEDControllerChart_State_event_consumed == 0 && 1) {
ButtonController_send_Bridge_BlueOFF(_instance);
ButtonController_send_WS_BlueOFF(_instance);
printf("[CPU] BlueOFF\n");
ButtonController_LEDControllerChart_State_event_consumed = 1;
}
}
}
void ButtonController_handle_Blue_UnoON(struct ButtonController_Instance *_instance) {
uint8_t ButtonController_LEDControllerChart_State_event_consumed = 0;
if (_instance->ButtonController_LEDControllerChart_State == BUTTONCONTROLLER_LEDCONTROLLERCHART_RUNNING_STATE) {
if (ButtonController_LEDControllerChart_State_event_consumed == 0 && 1) {
ButtonController_send_Bridge_BlueON(_instance);
ButtonController_send_WS_BlueON(_instance);
printf("[CPU] BlueON\n");
ButtonController_LEDControllerChart_State_event_consumed = 1;
}
}
}
void ButtonController_handle_Blue_DueON(struct ButtonController_Instance *_instance) {
uint8_t ButtonController_LEDControllerChart_State_event_consumed = 0;
if (_instance->ButtonController_LEDControllerChart_State == BUTTONCONTROLLER_LEDCONTROLLERCHART_RUNNING_STATE) {
if (ButtonController_LEDControllerChart_State_event_consumed == 0 && 1) {
ButtonController_send_Bridge_BlueON(_instance);
ButtonController_send_WS_BlueON(_instance);
printf("[CPU] BlueON\n");
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
void (*external_ButtonController_send_Bridge_GreenON_listener)(struct ButtonController_Instance *)= 0x0;
void register_external_ButtonController_send_Bridge_GreenON_listener(void (*_listener)(struct ButtonController_Instance *)){
external_ButtonController_send_Bridge_GreenON_listener = _listener;
}
void (*ButtonController_send_Bridge_GreenON_listener)(struct ButtonController_Instance *)= 0x0;
void register_ButtonController_send_Bridge_GreenON_listener(void (*_listener)(struct ButtonController_Instance *)){
ButtonController_send_Bridge_GreenON_listener = _listener;
}
void ButtonController_send_Bridge_GreenON(struct ButtonController_Instance *_instance){
if (ButtonController_send_Bridge_GreenON_listener != 0x0) ButtonController_send_Bridge_GreenON_listener(_instance);
if (external_ButtonController_send_Bridge_GreenON_listener != 0x0) external_ButtonController_send_Bridge_GreenON_listener(_instance);
;
}
void (*external_ButtonController_send_Bridge_GreenOFF_listener)(struct ButtonController_Instance *)= 0x0;
void register_external_ButtonController_send_Bridge_GreenOFF_listener(void (*_listener)(struct ButtonController_Instance *)){
external_ButtonController_send_Bridge_GreenOFF_listener = _listener;
}
void (*ButtonController_send_Bridge_GreenOFF_listener)(struct ButtonController_Instance *)= 0x0;
void register_ButtonController_send_Bridge_GreenOFF_listener(void (*_listener)(struct ButtonController_Instance *)){
ButtonController_send_Bridge_GreenOFF_listener = _listener;
}
void ButtonController_send_Bridge_GreenOFF(struct ButtonController_Instance *_instance){
if (ButtonController_send_Bridge_GreenOFF_listener != 0x0) ButtonController_send_Bridge_GreenOFF_listener(_instance);
if (external_ButtonController_send_Bridge_GreenOFF_listener != 0x0) external_ButtonController_send_Bridge_GreenOFF_listener(_instance);
;
}
void (*external_ButtonController_send_Bridge_BlueON_listener)(struct ButtonController_Instance *)= 0x0;
void register_external_ButtonController_send_Bridge_BlueON_listener(void (*_listener)(struct ButtonController_Instance *)){
external_ButtonController_send_Bridge_BlueON_listener = _listener;
}
void (*ButtonController_send_Bridge_BlueON_listener)(struct ButtonController_Instance *)= 0x0;
void register_ButtonController_send_Bridge_BlueON_listener(void (*_listener)(struct ButtonController_Instance *)){
ButtonController_send_Bridge_BlueON_listener = _listener;
}
void ButtonController_send_Bridge_BlueON(struct ButtonController_Instance *_instance){
if (ButtonController_send_Bridge_BlueON_listener != 0x0) ButtonController_send_Bridge_BlueON_listener(_instance);
if (external_ButtonController_send_Bridge_BlueON_listener != 0x0) external_ButtonController_send_Bridge_BlueON_listener(_instance);
;
}
void (*external_ButtonController_send_Bridge_BlueOFF_listener)(struct ButtonController_Instance *)= 0x0;
void register_external_ButtonController_send_Bridge_BlueOFF_listener(void (*_listener)(struct ButtonController_Instance *)){
external_ButtonController_send_Bridge_BlueOFF_listener = _listener;
}
void (*ButtonController_send_Bridge_BlueOFF_listener)(struct ButtonController_Instance *)= 0x0;
void register_ButtonController_send_Bridge_BlueOFF_listener(void (*_listener)(struct ButtonController_Instance *)){
ButtonController_send_Bridge_BlueOFF_listener = _listener;
}
void ButtonController_send_Bridge_BlueOFF(struct ButtonController_Instance *_instance){
if (ButtonController_send_Bridge_BlueOFF_listener != 0x0) ButtonController_send_Bridge_BlueOFF_listener(_instance);
if (external_ButtonController_send_Bridge_BlueOFF_listener != 0x0) external_ButtonController_send_Bridge_BlueOFF_listener(_instance);
;
}
void (*external_ButtonController_send_WS_GreenON_listener)(struct ButtonController_Instance *)= 0x0;
void register_external_ButtonController_send_WS_GreenON_listener(void (*_listener)(struct ButtonController_Instance *)){
external_ButtonController_send_WS_GreenON_listener = _listener;
}
void (*ButtonController_send_WS_GreenON_listener)(struct ButtonController_Instance *)= 0x0;
void register_ButtonController_send_WS_GreenON_listener(void (*_listener)(struct ButtonController_Instance *)){
ButtonController_send_WS_GreenON_listener = _listener;
}
void ButtonController_send_WS_GreenON(struct ButtonController_Instance *_instance){
if (ButtonController_send_WS_GreenON_listener != 0x0) ButtonController_send_WS_GreenON_listener(_instance);
if (external_ButtonController_send_WS_GreenON_listener != 0x0) external_ButtonController_send_WS_GreenON_listener(_instance);
;
}
void (*external_ButtonController_send_WS_GreenOFF_listener)(struct ButtonController_Instance *)= 0x0;
void register_external_ButtonController_send_WS_GreenOFF_listener(void (*_listener)(struct ButtonController_Instance *)){
external_ButtonController_send_WS_GreenOFF_listener = _listener;
}
void (*ButtonController_send_WS_GreenOFF_listener)(struct ButtonController_Instance *)= 0x0;
void register_ButtonController_send_WS_GreenOFF_listener(void (*_listener)(struct ButtonController_Instance *)){
ButtonController_send_WS_GreenOFF_listener = _listener;
}
void ButtonController_send_WS_GreenOFF(struct ButtonController_Instance *_instance){
if (ButtonController_send_WS_GreenOFF_listener != 0x0) ButtonController_send_WS_GreenOFF_listener(_instance);
if (external_ButtonController_send_WS_GreenOFF_listener != 0x0) external_ButtonController_send_WS_GreenOFF_listener(_instance);
;
}
void (*external_ButtonController_send_WS_BlueON_listener)(struct ButtonController_Instance *)= 0x0;
void register_external_ButtonController_send_WS_BlueON_listener(void (*_listener)(struct ButtonController_Instance *)){
external_ButtonController_send_WS_BlueON_listener = _listener;
}
void (*ButtonController_send_WS_BlueON_listener)(struct ButtonController_Instance *)= 0x0;
void register_ButtonController_send_WS_BlueON_listener(void (*_listener)(struct ButtonController_Instance *)){
ButtonController_send_WS_BlueON_listener = _listener;
}
void ButtonController_send_WS_BlueON(struct ButtonController_Instance *_instance){
if (ButtonController_send_WS_BlueON_listener != 0x0) ButtonController_send_WS_BlueON_listener(_instance);
if (external_ButtonController_send_WS_BlueON_listener != 0x0) external_ButtonController_send_WS_BlueON_listener(_instance);
;
}
void (*external_ButtonController_send_WS_BlueOFF_listener)(struct ButtonController_Instance *)= 0x0;
void register_external_ButtonController_send_WS_BlueOFF_listener(void (*_listener)(struct ButtonController_Instance *)){
external_ButtonController_send_WS_BlueOFF_listener = _listener;
}
void (*ButtonController_send_WS_BlueOFF_listener)(struct ButtonController_Instance *)= 0x0;
void register_ButtonController_send_WS_BlueOFF_listener(void (*_listener)(struct ButtonController_Instance *)){
ButtonController_send_WS_BlueOFF_listener = _listener;
}
void ButtonController_send_WS_BlueOFF(struct ButtonController_Instance *_instance){
if (ButtonController_send_WS_BlueOFF_listener != 0x0) ButtonController_send_WS_BlueOFF_listener(_instance);
if (external_ButtonController_send_WS_BlueOFF_listener != 0x0) external_ButtonController_send_WS_BlueOFF_listener(_instance);
;
}
void (*external_ButtonController_send_WS_UnoON_listener)(struct ButtonController_Instance *)= 0x0;
void register_external_ButtonController_send_WS_UnoON_listener(void (*_listener)(struct ButtonController_Instance *)){
external_ButtonController_send_WS_UnoON_listener = _listener;
}
void (*ButtonController_send_WS_UnoON_listener)(struct ButtonController_Instance *)= 0x0;
void register_ButtonController_send_WS_UnoON_listener(void (*_listener)(struct ButtonController_Instance *)){
ButtonController_send_WS_UnoON_listener = _listener;
}
void ButtonController_send_WS_UnoON(struct ButtonController_Instance *_instance){
if (ButtonController_send_WS_UnoON_listener != 0x0) ButtonController_send_WS_UnoON_listener(_instance);
if (external_ButtonController_send_WS_UnoON_listener != 0x0) external_ButtonController_send_WS_UnoON_listener(_instance);
;
}
void (*external_ButtonController_send_WS_UnoOFF_listener)(struct ButtonController_Instance *)= 0x0;
void register_external_ButtonController_send_WS_UnoOFF_listener(void (*_listener)(struct ButtonController_Instance *)){
external_ButtonController_send_WS_UnoOFF_listener = _listener;
}
void (*ButtonController_send_WS_UnoOFF_listener)(struct ButtonController_Instance *)= 0x0;
void register_ButtonController_send_WS_UnoOFF_listener(void (*_listener)(struct ButtonController_Instance *)){
ButtonController_send_WS_UnoOFF_listener = _listener;
}
void ButtonController_send_WS_UnoOFF(struct ButtonController_Instance *_instance){
if (ButtonController_send_WS_UnoOFF_listener != 0x0) ButtonController_send_WS_UnoOFF_listener(_instance);
if (external_ButtonController_send_WS_UnoOFF_listener != 0x0) external_ButtonController_send_WS_UnoOFF_listener(_instance);
;
}
void (*external_ButtonController_send_WS_DueON_listener)(struct ButtonController_Instance *)= 0x0;
void register_external_ButtonController_send_WS_DueON_listener(void (*_listener)(struct ButtonController_Instance *)){
external_ButtonController_send_WS_DueON_listener = _listener;
}
void (*ButtonController_send_WS_DueON_listener)(struct ButtonController_Instance *)= 0x0;
void register_ButtonController_send_WS_DueON_listener(void (*_listener)(struct ButtonController_Instance *)){
ButtonController_send_WS_DueON_listener = _listener;
}
void ButtonController_send_WS_DueON(struct ButtonController_Instance *_instance){
if (ButtonController_send_WS_DueON_listener != 0x0) ButtonController_send_WS_DueON_listener(_instance);
if (external_ButtonController_send_WS_DueON_listener != 0x0) external_ButtonController_send_WS_DueON_listener(_instance);
;
}
void (*external_ButtonController_send_WS_DueOFF_listener)(struct ButtonController_Instance *)= 0x0;
void register_external_ButtonController_send_WS_DueOFF_listener(void (*_listener)(struct ButtonController_Instance *)){
external_ButtonController_send_WS_DueOFF_listener = _listener;
}
void (*ButtonController_send_WS_DueOFF_listener)(struct ButtonController_Instance *)= 0x0;
void register_ButtonController_send_WS_DueOFF_listener(void (*_listener)(struct ButtonController_Instance *)){
ButtonController_send_WS_DueOFF_listener = _listener;
}
void ButtonController_send_WS_DueOFF(struct ButtonController_Instance *_instance){
if (ButtonController_send_WS_DueOFF_listener != 0x0) ButtonController_send_WS_DueOFF_listener(_instance);
if (external_ButtonController_send_WS_DueOFF_listener != 0x0) external_ButtonController_send_WS_DueOFF_listener(_instance);
;
}
void (*external_ButtonController_send_Green_Useless_listener)(struct ButtonController_Instance *)= 0x0;
void register_external_ButtonController_send_Green_Useless_listener(void (*_listener)(struct ButtonController_Instance *)){
external_ButtonController_send_Green_Useless_listener = _listener;
}
void (*ButtonController_send_Green_Useless_listener)(struct ButtonController_Instance *)= 0x0;
void register_ButtonController_send_Green_Useless_listener(void (*_listener)(struct ButtonController_Instance *)){
ButtonController_send_Green_Useless_listener = _listener;
}
void ButtonController_send_Green_Useless(struct ButtonController_Instance *_instance){
if (ButtonController_send_Green_Useless_listener != 0x0) ButtonController_send_Green_Useless_listener(_instance);
if (external_ButtonController_send_Green_Useless_listener != 0x0) external_ButtonController_send_Green_Useless_listener(_instance);
;
}
void (*external_ButtonController_send_Blue_Useless_listener)(struct ButtonController_Instance *)= 0x0;
void register_external_ButtonController_send_Blue_Useless_listener(void (*_listener)(struct ButtonController_Instance *)){
external_ButtonController_send_Blue_Useless_listener = _listener;
}
void (*ButtonController_send_Blue_Useless_listener)(struct ButtonController_Instance *)= 0x0;
void register_ButtonController_send_Blue_Useless_listener(void (*_listener)(struct ButtonController_Instance *)){
ButtonController_send_Blue_Useless_listener = _listener;
}
void ButtonController_send_Blue_Useless(struct ButtonController_Instance *_instance){
if (ButtonController_send_Blue_Useless_listener != 0x0) ButtonController_send_Blue_Useless_listener(_instance);
if (external_ButtonController_send_Blue_Useless_listener != 0x0) external_ButtonController_send_Blue_Useless_listener(_instance);
;
}
void (*external_ButtonController_send_Uno_UnoON_listener)(struct ButtonController_Instance *)= 0x0;
void register_external_ButtonController_send_Uno_UnoON_listener(void (*_listener)(struct ButtonController_Instance *)){
external_ButtonController_send_Uno_UnoON_listener = _listener;
}
void (*ButtonController_send_Uno_UnoON_listener)(struct ButtonController_Instance *)= 0x0;
void register_ButtonController_send_Uno_UnoON_listener(void (*_listener)(struct ButtonController_Instance *)){
ButtonController_send_Uno_UnoON_listener = _listener;
}
void ButtonController_send_Uno_UnoON(struct ButtonController_Instance *_instance){
if (ButtonController_send_Uno_UnoON_listener != 0x0) ButtonController_send_Uno_UnoON_listener(_instance);
if (external_ButtonController_send_Uno_UnoON_listener != 0x0) external_ButtonController_send_Uno_UnoON_listener(_instance);
;
}
void (*external_ButtonController_send_Uno_UnoOFF_listener)(struct ButtonController_Instance *)= 0x0;
void register_external_ButtonController_send_Uno_UnoOFF_listener(void (*_listener)(struct ButtonController_Instance *)){
external_ButtonController_send_Uno_UnoOFF_listener = _listener;
}
void (*ButtonController_send_Uno_UnoOFF_listener)(struct ButtonController_Instance *)= 0x0;
void register_ButtonController_send_Uno_UnoOFF_listener(void (*_listener)(struct ButtonController_Instance *)){
ButtonController_send_Uno_UnoOFF_listener = _listener;
}
void ButtonController_send_Uno_UnoOFF(struct ButtonController_Instance *_instance){
if (ButtonController_send_Uno_UnoOFF_listener != 0x0) ButtonController_send_Uno_UnoOFF_listener(_instance);
if (external_ButtonController_send_Uno_UnoOFF_listener != 0x0) external_ButtonController_send_Uno_UnoOFF_listener(_instance);
;
}
void (*external_ButtonController_send_Uno_DueON_listener)(struct ButtonController_Instance *)= 0x0;
void register_external_ButtonController_send_Uno_DueON_listener(void (*_listener)(struct ButtonController_Instance *)){
external_ButtonController_send_Uno_DueON_listener = _listener;
}
void (*ButtonController_send_Uno_DueON_listener)(struct ButtonController_Instance *)= 0x0;
void register_ButtonController_send_Uno_DueON_listener(void (*_listener)(struct ButtonController_Instance *)){
ButtonController_send_Uno_DueON_listener = _listener;
}
void ButtonController_send_Uno_DueON(struct ButtonController_Instance *_instance){
if (ButtonController_send_Uno_DueON_listener != 0x0) ButtonController_send_Uno_DueON_listener(_instance);
if (external_ButtonController_send_Uno_DueON_listener != 0x0) external_ButtonController_send_Uno_DueON_listener(_instance);
;
}
void (*external_ButtonController_send_Uno_DueOFF_listener)(struct ButtonController_Instance *)= 0x0;
void register_external_ButtonController_send_Uno_DueOFF_listener(void (*_listener)(struct ButtonController_Instance *)){
external_ButtonController_send_Uno_DueOFF_listener = _listener;
}
void (*ButtonController_send_Uno_DueOFF_listener)(struct ButtonController_Instance *)= 0x0;
void register_ButtonController_send_Uno_DueOFF_listener(void (*_listener)(struct ButtonController_Instance *)){
ButtonController_send_Uno_DueOFF_listener = _listener;
}
void ButtonController_send_Uno_DueOFF(struct ButtonController_Instance *_instance){
if (ButtonController_send_Uno_DueOFF_listener != 0x0) ButtonController_send_Uno_DueOFF_listener(_instance);
if (external_ButtonController_send_Uno_DueOFF_listener != 0x0) external_ButtonController_send_Uno_DueOFF_listener(_instance);
;
}
void (*external_ButtonController_send_Due_UnoON_listener)(struct ButtonController_Instance *)= 0x0;
void register_external_ButtonController_send_Due_UnoON_listener(void (*_listener)(struct ButtonController_Instance *)){
external_ButtonController_send_Due_UnoON_listener = _listener;
}
void (*ButtonController_send_Due_UnoON_listener)(struct ButtonController_Instance *)= 0x0;
void register_ButtonController_send_Due_UnoON_listener(void (*_listener)(struct ButtonController_Instance *)){
ButtonController_send_Due_UnoON_listener = _listener;
}
void ButtonController_send_Due_UnoON(struct ButtonController_Instance *_instance){
if (ButtonController_send_Due_UnoON_listener != 0x0) ButtonController_send_Due_UnoON_listener(_instance);
if (external_ButtonController_send_Due_UnoON_listener != 0x0) external_ButtonController_send_Due_UnoON_listener(_instance);
;
}
void (*external_ButtonController_send_Due_UnoOFF_listener)(struct ButtonController_Instance *)= 0x0;
void register_external_ButtonController_send_Due_UnoOFF_listener(void (*_listener)(struct ButtonController_Instance *)){
external_ButtonController_send_Due_UnoOFF_listener = _listener;
}
void (*ButtonController_send_Due_UnoOFF_listener)(struct ButtonController_Instance *)= 0x0;
void register_ButtonController_send_Due_UnoOFF_listener(void (*_listener)(struct ButtonController_Instance *)){
ButtonController_send_Due_UnoOFF_listener = _listener;
}
void ButtonController_send_Due_UnoOFF(struct ButtonController_Instance *_instance){
if (ButtonController_send_Due_UnoOFF_listener != 0x0) ButtonController_send_Due_UnoOFF_listener(_instance);
if (external_ButtonController_send_Due_UnoOFF_listener != 0x0) external_ButtonController_send_Due_UnoOFF_listener(_instance);
;
}
void (*external_ButtonController_send_Due_DueON_listener)(struct ButtonController_Instance *)= 0x0;
void register_external_ButtonController_send_Due_DueON_listener(void (*_listener)(struct ButtonController_Instance *)){
external_ButtonController_send_Due_DueON_listener = _listener;
}
void (*ButtonController_send_Due_DueON_listener)(struct ButtonController_Instance *)= 0x0;
void register_ButtonController_send_Due_DueON_listener(void (*_listener)(struct ButtonController_Instance *)){
ButtonController_send_Due_DueON_listener = _listener;
}
void ButtonController_send_Due_DueON(struct ButtonController_Instance *_instance){
if (ButtonController_send_Due_DueON_listener != 0x0) ButtonController_send_Due_DueON_listener(_instance);
if (external_ButtonController_send_Due_DueON_listener != 0x0) external_ButtonController_send_Due_DueON_listener(_instance);
;
}
void (*external_ButtonController_send_Due_DueOFF_listener)(struct ButtonController_Instance *)= 0x0;
void register_external_ButtonController_send_Due_DueOFF_listener(void (*_listener)(struct ButtonController_Instance *)){
external_ButtonController_send_Due_DueOFF_listener = _listener;
}
void (*ButtonController_send_Due_DueOFF_listener)(struct ButtonController_Instance *)= 0x0;
void register_ButtonController_send_Due_DueOFF_listener(void (*_listener)(struct ButtonController_Instance *)){
ButtonController_send_Due_DueOFF_listener = _listener;
}
void ButtonController_send_Due_DueOFF(struct ButtonController_Instance *_instance){
if (ButtonController_send_Due_DueOFF_listener != 0x0) ButtonController_send_Due_DueOFF_listener(_instance);
if (external_ButtonController_send_Due_DueOFF_listener != 0x0) external_ButtonController_send_Due_DueOFF_listener(_instance);
;
}



