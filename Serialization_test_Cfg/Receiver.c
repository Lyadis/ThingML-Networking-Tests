/*****************************************************
 *      THIS IS A GENERATED FILE. DO NOT EDIT.
 *        Implementation for Thing Receiver
 *  Generated from ThingML (http://www.thingml.org)
 *****************************************************/

#include "Receiver.h"

/*****************************************************************************
 * Implementation for type : Receiver
 *****************************************************************************/

// Declaration of prototypes:
void Receiver_SenderChart_OnExit(int state, struct Receiver_Instance *_instance);
void Receiver_send_myPort_ready(struct Receiver_Instance *_instance);
// Declaration of functions:

// On Entry Actions:
void Receiver_SenderChart_OnEntry(int state, struct Receiver_Instance *_instance) {
switch(state) {
case RECEIVER_SENDERCHART_STATE:
_instance->Receiver_SenderChart_State = RECEIVER_SENDERCHART_INIT_STATE;
Receiver_SenderChart_OnEntry(_instance->Receiver_SenderChart_State, _instance);
break;
case RECEIVER_SENDERCHART_INIT_STATE:
fprintf(stdout, "[Receiver] Ready\n");
Receiver_send_myPort_ready(_instance);
break;
default: break;
}
}

// On Exit Actions:
void Receiver_SenderChart_OnExit(int state, struct Receiver_Instance *_instance) {
switch(state) {
case RECEIVER_SENDERCHART_STATE:
Receiver_SenderChart_OnExit(_instance->Receiver_SenderChart_State, _instance);
break;
case RECEIVER_SENDERCHART_INIT_STATE:
break;
default: break;
}
}

// Event Handlers for incoming messages:
void Receiver_handle_myPort_mDouble(struct Receiver_Instance *_instance, double p) {
uint8_t Receiver_SenderChart_State_event_consumed = 0;
if (_instance->Receiver_SenderChart_State == RECEIVER_SENDERCHART_INIT_STATE) {
if (Receiver_SenderChart_State_event_consumed == 0 && 1) {
fprintf(stdout, "[Receiver] received mDouble ");
printf(" %f",p);
printf(" %x",p);
fprintf(stdout, "\n");
Receiver_SenderChart_State_event_consumed = 1;
}
}
}
void Receiver_handle_myPort_mBoolean(struct Receiver_Instance *_instance, uint8_t p) {
uint8_t Receiver_SenderChart_State_event_consumed = 0;
if (_instance->Receiver_SenderChart_State == RECEIVER_SENDERCHART_INIT_STATE) {
if (Receiver_SenderChart_State_event_consumed == 0 && 1) {
fprintf(stdout, "[Receiver] received mBoolean ");
printf(" %i",p);
printf(" %x",p);
fprintf(stdout, "\n");
Receiver_SenderChart_State_event_consumed = 1;
}
}
}
void Receiver_handle_myPort_mUInt16(struct Receiver_Instance *_instance, uint16_t p) {
uint8_t Receiver_SenderChart_State_event_consumed = 0;
if (_instance->Receiver_SenderChart_State == RECEIVER_SENDERCHART_INIT_STATE) {
if (Receiver_SenderChart_State_event_consumed == 0 && 1) {
fprintf(stdout, "[Receiver] received mUInt16 ");
printf(" %i",p);
printf(" %x",p);
fprintf(stdout, "\n");
Receiver_SenderChart_State_event_consumed = 1;
}
}
}
void Receiver_handle_myPort_mLong(struct Receiver_Instance *_instance, long p) {
uint8_t Receiver_SenderChart_State_event_consumed = 0;
if (_instance->Receiver_SenderChart_State == RECEIVER_SENDERCHART_INIT_STATE) {
if (Receiver_SenderChart_State_event_consumed == 0 && 1) {
fprintf(stdout, "[Receiver] received mLong ");
printf(" %i",p);
printf(" %x",p);
fprintf(stdout, "\n");
Receiver_SenderChart_State_event_consumed = 1;
}
}
}
void Receiver_handle_myPort_mEnum(struct Receiver_Instance *_instance, uint8_t p) {
uint8_t Receiver_SenderChart_State_event_consumed = 0;
if (_instance->Receiver_SenderChart_State == RECEIVER_SENDERCHART_INIT_STATE) {
if (Receiver_SenderChart_State_event_consumed == 0 && 1) {
fprintf(stdout, "[Receiver] received mEnum ");
fprintf(stdout, "\n");
Receiver_SenderChart_State_event_consumed = 1;
}
}
}
void Receiver_handle_myPort_mInteger(struct Receiver_Instance *_instance, int16_t p) {
uint8_t Receiver_SenderChart_State_event_consumed = 0;
if (_instance->Receiver_SenderChart_State == RECEIVER_SENDERCHART_INIT_STATE) {
if (Receiver_SenderChart_State_event_consumed == 0 && 1) {
fprintf(stdout, "[Receiver] received mInteger ");
printf(" %i",p);
printf(" %x",p);
fprintf(stdout, "\n");
Receiver_SenderChart_State_event_consumed = 1;
}
}
}
void Receiver_handle_myPort_mEmpty(struct Receiver_Instance *_instance) {
uint8_t Receiver_SenderChart_State_event_consumed = 0;
if (_instance->Receiver_SenderChart_State == RECEIVER_SENDERCHART_INIT_STATE) {
if (Receiver_SenderChart_State_event_consumed == 0 && 1) {
fprintf(stdout, "[Receiver] received mEmpty ");
fprintf(stdout, "\n");
Receiver_SenderChart_State_event_consumed = 1;
}
}
}
void Receiver_handle_myPort_mUInt8(struct Receiver_Instance *_instance, uint8_t p) {
uint8_t Receiver_SenderChart_State_event_consumed = 0;
if (_instance->Receiver_SenderChart_State == RECEIVER_SENDERCHART_INIT_STATE) {
if (Receiver_SenderChart_State_event_consumed == 0 && 1) {
fprintf(stdout, "[Receiver] received mUInt8 ");
printf(" %i",p);
printf(" %x",p);
fprintf(stdout, "\n");
Receiver_SenderChart_State_event_consumed = 1;
}
}
}
void Receiver_handle_myPort_mChar(struct Receiver_Instance *_instance, char p) {
uint8_t Receiver_SenderChart_State_event_consumed = 0;
if (_instance->Receiver_SenderChart_State == RECEIVER_SENDERCHART_INIT_STATE) {
if (Receiver_SenderChart_State_event_consumed == 0 && 1) {
fprintf(stdout, "[Receiver] received mChar ");
printf(" %c",p);
printf(" %x",p);
fprintf(stdout, "\n");
Receiver_SenderChart_State_event_consumed = 1;
}
}
}
void Receiver_handle_myPort_mInt16(struct Receiver_Instance *_instance, int16_t p) {
uint8_t Receiver_SenderChart_State_event_consumed = 0;
if (_instance->Receiver_SenderChart_State == RECEIVER_SENDERCHART_INIT_STATE) {
if (Receiver_SenderChart_State_event_consumed == 0 && 1) {
fprintf(stdout, "[Receiver] received mInt16 ");
printf(" %i",p);
printf(" %x",p);
fprintf(stdout, "\n");
Receiver_SenderChart_State_event_consumed = 1;
}
}
}
void Receiver_handle_myPort_mFloat(struct Receiver_Instance *_instance, float p) {
uint8_t Receiver_SenderChart_State_event_consumed = 0;
if (_instance->Receiver_SenderChart_State == RECEIVER_SENDERCHART_INIT_STATE) {
if (Receiver_SenderChart_State_event_consumed == 0 && 1) {
fprintf(stdout, "[Receiver] received mFloat ");
printf(" %f",p);
printf(" %x",p);
fprintf(stdout, "\n");
Receiver_SenderChart_State_event_consumed = 1;
}
}
}
void Receiver_handle_myPort_mUInt32(struct Receiver_Instance *_instance, uint32_t p) {
uint8_t Receiver_SenderChart_State_event_consumed = 0;
if (_instance->Receiver_SenderChart_State == RECEIVER_SENDERCHART_INIT_STATE) {
if (Receiver_SenderChart_State_event_consumed == 0 && 1) {
fprintf(stdout, "[Receiver] received mUInt32 ");
printf(" %i",p);
printf(" %x",p);
fprintf(stdout, "\n");
Receiver_SenderChart_State_event_consumed = 1;
}
}
}
void Receiver_handle_myPort_mDoubleFloat(struct Receiver_Instance *_instance, float p1, float p2) {
uint8_t Receiver_SenderChart_State_event_consumed = 0;
if (_instance->Receiver_SenderChart_State == RECEIVER_SENDERCHART_INIT_STATE) {
if (Receiver_SenderChart_State_event_consumed == 0 && 1) {
fprintf(stdout, "[Receiver] received mFloat ");
printf(" %f",p1);
printf(" %x",p1);
fprintf(stdout, " ");
printf(" %f",p2);
printf(" %x",p2);
fprintf(stdout, "\n");
Receiver_SenderChart_State_event_consumed = 1;
}
}
}

// Observers for outgoing messages:
void (*external_Receiver_send_myPort_ready_listener)(struct Receiver_Instance *)= 0x0;
void register_external_Receiver_send_myPort_ready_listener(void (*_listener)(struct Receiver_Instance *)){
external_Receiver_send_myPort_ready_listener = _listener;
}
void (*Receiver_send_myPort_ready_listener)(struct Receiver_Instance *)= 0x0;
void register_Receiver_send_myPort_ready_listener(void (*_listener)(struct Receiver_Instance *)){
Receiver_send_myPort_ready_listener = _listener;
}
void Receiver_send_myPort_ready(struct Receiver_Instance *_instance){
if (Receiver_send_myPort_ready_listener != 0x0) Receiver_send_myPort_ready_listener(_instance);
if (external_Receiver_send_myPort_ready_listener != 0x0) external_Receiver_send_myPort_ready_listener(_instance);
;
}



