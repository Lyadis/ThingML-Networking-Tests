/*****************************************************
 *      THIS IS A GENERATED FILE. DO NOT EDIT.
 *        Implementation for Thing Sender
 *  Generated from ThingML (http://www.thingml.org)
 *****************************************************/

#include "Sender.h"

/*****************************************************************************
 * Implementation for type : Sender
 *****************************************************************************/

// Declaration of prototypes:
void Sender_SenderChart_OnExit(int state, struct Sender_Instance *_instance);
void Sender_send_myPort_mEmpty(struct Sender_Instance *_instance);
void Sender_send_myPort_mChar(struct Sender_Instance *_instance, char p);
void Sender_send_myPort_mBoolean(struct Sender_Instance *_instance, uint8_t p);
void Sender_send_myPort_mUInt8(struct Sender_Instance *_instance, uint8_t p);
void Sender_send_myPort_mUInt16(struct Sender_Instance *_instance, uint16_t p);
void Sender_send_myPort_mInt16(struct Sender_Instance *_instance, int16_t p);
void Sender_send_myPort_mUInt32(struct Sender_Instance *_instance, uint32_t p);
void Sender_send_myPort_mInteger(struct Sender_Instance *_instance, int16_t p);
void Sender_send_myPort_mLong(struct Sender_Instance *_instance, long p);
void Sender_send_myPort_mDouble(struct Sender_Instance *_instance, double p);
void Sender_send_myPort_mFloat(struct Sender_Instance *_instance, float p);
void Sender_send_myPort_mEnum(struct Sender_Instance *_instance, uint8_t p);
void Sender_send_myPort_mDoubleFloat(struct Sender_Instance *_instance, float p1, float p2);
// Declaration of functions:

// On Entry Actions:
void Sender_SenderChart_OnEntry(int state, struct Sender_Instance *_instance) {
switch(state) {
case SENDER_SENDERCHART_STATE:
_instance->Sender_SenderChart_State = SENDER_SENDERCHART_INIT_STATE;
Sender_SenderChart_OnEntry(_instance->Sender_SenderChart_State, _instance);
break;
case SENDER_SENDERCHART_INIT_STATE:
printf("[Sender] Entering state: Init\n");
fprintf(stdout, "[Sender] Ready\n");
break;
case SENDER_SENDERCHART_SEND_MEMTPY_STATE:
printf("[Sender] Entering state: Send_mEmtpy\n");
Sender_send_myPort_mEmpty(_instance);
fprintf(stdout, "[Sender] sent mEmpty()\n");
break;
case SENDER_SENDERCHART_SEND_MCHAR_STATE:
printf("[Sender] Entering state: Send_mChar\n");
Sender_send_myPort_mChar(_instance, 'c');
fprintf(stdout, "[Sender] sent mChar(\'c\')\n");
break;
case SENDER_SENDERCHART_SEND_MBOOLEAN_STATE:
printf("[Sender] Entering state: Send_mBoolean\n");
Sender_send_myPort_mBoolean(_instance, 1);
fprintf(stdout, "[Sender] sent mBoolean(true)\n");
break;
case SENDER_SENDERCHART_SEND_MUINT8_STATE:
printf("[Sender] Entering state: Send_mUInt8\n");
Sender_send_myPort_mUInt8(_instance, 255);
fprintf(stdout, "[Sender] sent mUInt8(255)\n");
break;
case SENDER_SENDERCHART_SEND_MUINT16_STATE:
printf("[Sender] Entering state: Send_mUInt16\n");
Sender_send_myPort_mUInt16(_instance, 12345);
fprintf(stdout, "[Sender] sent mUInt16(12345)\n");
break;
case SENDER_SENDERCHART_SEND_MINT16_STATE:
printf("[Sender] Entering state: Send_mInt16\n");
Sender_send_myPort_mInt16(_instance, -12345);
fprintf(stdout, "[Sender] sent mInt16(\'-12345\')");
printf(" %x \n", -12345);
break;
case SENDER_SENDERCHART_SEND_MUINT32_STATE:
printf("[Sender] Entering state: Send_mUInt32\n");
Sender_send_myPort_mUInt32(_instance, 1234567);
fprintf(stdout, "[Sender] sent mUInt32(1234567)\n");
break;
case SENDER_SENDERCHART_SEND_MINTEGER_STATE:
printf("[Sender] Entering state: Send_mInteger\n");
Sender_send_myPort_mInteger(_instance, 0xFFFF);
fprintf(stdout, "[Sender] sent mInteger(\'0xFFFF\')\n");
break;
case SENDER_SENDERCHART_SEND_MFLOAT_STATE:
printf("[Sender] Entering state: Send_mFloat\n");
Sender_send_myPort_mFloat(_instance, 3.14);
fprintf(stdout, "[Sender] sent mFloat(3.14)");
printf(" %x \n", 3.14);
break;
case SENDER_SENDERCHART_SEND_MDOUBLEFLOAT_STATE:
printf("[Sender] Entering state: Send_mDoubleFloat\n");
Sender_send_myPort_mDoubleFloat(_instance, 3.14, 3.14);
fprintf(stdout, "[Sender] sent mDoubleFloat(3.14, 3.14)");
printf(" %x \n", 3.14);
break;
case SENDER_SENDERCHART_SEND_MDOUBLE_STATE:
printf("[Sender] Entering state: Send_mDouble\n");
Sender_send_myPort_mDouble(_instance, 3.14);
fprintf(stdout, "[Sender] sent mDouble(3.14)");
printf(" %x \n", 3.14);
break;
case SENDER_SENDERCHART_SEND_MLONG_STATE:
printf("[Sender] Entering state: Send_mLong\n");
Sender_send_myPort_mLong(_instance,  -1);
fprintf(stdout, "[Sender] sent mLong(-1)");
printf(" %x \n", -1);
break;
case SENDER_SENDERCHART_SEND_MENUM_STATE:
printf("[Sender] Entering state: Send_mEnum\n");
Sender_send_myPort_mEnum(_instance, DIGITALSTATE_HIGH);
fprintf(stdout, "[Sender] sent mEnum(DigitalState:HIGH)\n");
fprintf(stdout, "[Sender] Done.\n");
break;
default: break;
}
}

// On Exit Actions:
void Sender_SenderChart_OnExit(int state, struct Sender_Instance *_instance) {
switch(state) {
case SENDER_SENDERCHART_STATE:
Sender_SenderChart_OnExit(_instance->Sender_SenderChart_State, _instance);
break;
case SENDER_SENDERCHART_INIT_STATE:
break;
case SENDER_SENDERCHART_SEND_MEMTPY_STATE:
break;
case SENDER_SENDERCHART_SEND_MCHAR_STATE:
break;
case SENDER_SENDERCHART_SEND_MBOOLEAN_STATE:
break;
case SENDER_SENDERCHART_SEND_MUINT8_STATE:
break;
case SENDER_SENDERCHART_SEND_MUINT16_STATE:
break;
case SENDER_SENDERCHART_SEND_MINT16_STATE:
break;
case SENDER_SENDERCHART_SEND_MUINT32_STATE:
break;
case SENDER_SENDERCHART_SEND_MINTEGER_STATE:
break;
case SENDER_SENDERCHART_SEND_MFLOAT_STATE:
break;
case SENDER_SENDERCHART_SEND_MDOUBLEFLOAT_STATE:
break;
case SENDER_SENDERCHART_SEND_MDOUBLE_STATE:
break;
case SENDER_SENDERCHART_SEND_MLONG_STATE:
break;
case SENDER_SENDERCHART_SEND_MENUM_STATE:
break;
default: break;
}
}

// Event Handlers for incoming messages:
void Sender_handle_myPort_ready(struct Sender_Instance *_instance) {
printf("[Sender] handling: myPort?ready\n");
uint8_t Sender_SenderChart_State_event_consumed = 0;
if (_instance->Sender_SenderChart_State == SENDER_SENDERCHART_INIT_STATE) {
if (Sender_SenderChart_State_event_consumed == 0 && 1) {
Sender_SenderChart_OnExit(SENDER_SENDERCHART_INIT_STATE, _instance);
_instance->Sender_SenderChart_State = SENDER_SENDERCHART_SEND_MEMTPY_STATE;
fprintf(stdout, "[Sender] received ready\n");
Sender_SenderChart_OnEntry(SENDER_SENDERCHART_SEND_MEMTPY_STATE, _instance);
Sender_SenderChart_State_event_consumed = 1;
}
}
}
void Sender_handle_empty_event(struct Sender_Instance *_instance) {
if (_instance->Sender_SenderChart_State == SENDER_SENDERCHART_SEND_MEMTPY_STATE) {
if (1) {
Sender_SenderChart_OnExit(SENDER_SENDERCHART_SEND_MEMTPY_STATE, _instance);
_instance->Sender_SenderChart_State = SENDER_SENDERCHART_SEND_MCHAR_STATE;
Sender_SenderChart_OnEntry(SENDER_SENDERCHART_SEND_MCHAR_STATE, _instance);
}
}
else if (_instance->Sender_SenderChart_State == SENDER_SENDERCHART_SEND_MCHAR_STATE) {
if (1) {
Sender_SenderChart_OnExit(SENDER_SENDERCHART_SEND_MCHAR_STATE, _instance);
_instance->Sender_SenderChart_State = SENDER_SENDERCHART_SEND_MBOOLEAN_STATE;
Sender_SenderChart_OnEntry(SENDER_SENDERCHART_SEND_MBOOLEAN_STATE, _instance);
}
}
else if (_instance->Sender_SenderChart_State == SENDER_SENDERCHART_SEND_MBOOLEAN_STATE) {
if (1) {
Sender_SenderChart_OnExit(SENDER_SENDERCHART_SEND_MBOOLEAN_STATE, _instance);
_instance->Sender_SenderChart_State = SENDER_SENDERCHART_SEND_MUINT8_STATE;
Sender_SenderChart_OnEntry(SENDER_SENDERCHART_SEND_MUINT8_STATE, _instance);
}
}
else if (_instance->Sender_SenderChart_State == SENDER_SENDERCHART_SEND_MUINT8_STATE) {
if (1) {
Sender_SenderChart_OnExit(SENDER_SENDERCHART_SEND_MUINT8_STATE, _instance);
_instance->Sender_SenderChart_State = SENDER_SENDERCHART_SEND_MUINT16_STATE;
Sender_SenderChart_OnEntry(SENDER_SENDERCHART_SEND_MUINT16_STATE, _instance);
}
}
else if (_instance->Sender_SenderChart_State == SENDER_SENDERCHART_SEND_MUINT16_STATE) {
if (1) {
Sender_SenderChart_OnExit(SENDER_SENDERCHART_SEND_MUINT16_STATE, _instance);
_instance->Sender_SenderChart_State = SENDER_SENDERCHART_SEND_MINT16_STATE;
Sender_SenderChart_OnEntry(SENDER_SENDERCHART_SEND_MINT16_STATE, _instance);
}
}
else if (_instance->Sender_SenderChart_State == SENDER_SENDERCHART_SEND_MINT16_STATE) {
if (1) {
Sender_SenderChart_OnExit(SENDER_SENDERCHART_SEND_MINT16_STATE, _instance);
_instance->Sender_SenderChart_State = SENDER_SENDERCHART_SEND_MUINT32_STATE;
Sender_SenderChart_OnEntry(SENDER_SENDERCHART_SEND_MUINT32_STATE, _instance);
}
}
else if (_instance->Sender_SenderChart_State == SENDER_SENDERCHART_SEND_MUINT32_STATE) {
if (1) {
Sender_SenderChart_OnExit(SENDER_SENDERCHART_SEND_MUINT32_STATE, _instance);
_instance->Sender_SenderChart_State = SENDER_SENDERCHART_SEND_MINTEGER_STATE;
Sender_SenderChart_OnEntry(SENDER_SENDERCHART_SEND_MINTEGER_STATE, _instance);
}
}
else if (_instance->Sender_SenderChart_State == SENDER_SENDERCHART_SEND_MINTEGER_STATE) {
if (1) {
Sender_SenderChart_OnExit(SENDER_SENDERCHART_SEND_MINTEGER_STATE, _instance);
_instance->Sender_SenderChart_State = SENDER_SENDERCHART_SEND_MFLOAT_STATE;
Sender_SenderChart_OnEntry(SENDER_SENDERCHART_SEND_MFLOAT_STATE, _instance);
}
}
else if (_instance->Sender_SenderChart_State == SENDER_SENDERCHART_SEND_MFLOAT_STATE) {
if (1) {
Sender_SenderChart_OnExit(SENDER_SENDERCHART_SEND_MFLOAT_STATE, _instance);
_instance->Sender_SenderChart_State = SENDER_SENDERCHART_SEND_MDOUBLEFLOAT_STATE;
Sender_SenderChart_OnEntry(SENDER_SENDERCHART_SEND_MDOUBLEFLOAT_STATE, _instance);
}
}
else if (_instance->Sender_SenderChart_State == SENDER_SENDERCHART_SEND_MDOUBLEFLOAT_STATE) {
if (1) {
Sender_SenderChart_OnExit(SENDER_SENDERCHART_SEND_MDOUBLEFLOAT_STATE, _instance);
_instance->Sender_SenderChart_State = SENDER_SENDERCHART_SEND_MDOUBLE_STATE;
Sender_SenderChart_OnEntry(SENDER_SENDERCHART_SEND_MDOUBLE_STATE, _instance);
}
}
else if (_instance->Sender_SenderChart_State == SENDER_SENDERCHART_SEND_MDOUBLE_STATE) {
if (1) {
Sender_SenderChart_OnExit(SENDER_SENDERCHART_SEND_MDOUBLE_STATE, _instance);
_instance->Sender_SenderChart_State = SENDER_SENDERCHART_SEND_MLONG_STATE;
Sender_SenderChart_OnEntry(SENDER_SENDERCHART_SEND_MLONG_STATE, _instance);
}
}
else if (_instance->Sender_SenderChart_State == SENDER_SENDERCHART_SEND_MLONG_STATE) {
if (1) {
Sender_SenderChart_OnExit(SENDER_SENDERCHART_SEND_MLONG_STATE, _instance);
_instance->Sender_SenderChart_State = SENDER_SENDERCHART_SEND_MENUM_STATE;
Sender_SenderChart_OnEntry(SENDER_SENDERCHART_SEND_MENUM_STATE, _instance);
}
}
}

// Observers for outgoing messages:
void (*external_Sender_send_myPort_mEmpty_listener)(struct Sender_Instance *)= 0x0;
void register_external_Sender_send_myPort_mEmpty_listener(void (*_listener)(struct Sender_Instance *)){
external_Sender_send_myPort_mEmpty_listener = _listener;
}
void (*Sender_send_myPort_mEmpty_listener)(struct Sender_Instance *)= 0x0;
void register_Sender_send_myPort_mEmpty_listener(void (*_listener)(struct Sender_Instance *)){
Sender_send_myPort_mEmpty_listener = _listener;
}
void Sender_send_myPort_mEmpty(struct Sender_Instance *_instance){
if (Sender_send_myPort_mEmpty_listener != 0x0) Sender_send_myPort_mEmpty_listener(_instance);
if (external_Sender_send_myPort_mEmpty_listener != 0x0) external_Sender_send_myPort_mEmpty_listener(_instance);
;
}
void (*external_Sender_send_myPort_mChar_listener)(struct Sender_Instance *, char)= 0x0;
void register_external_Sender_send_myPort_mChar_listener(void (*_listener)(struct Sender_Instance *, char)){
external_Sender_send_myPort_mChar_listener = _listener;
}
void (*Sender_send_myPort_mChar_listener)(struct Sender_Instance *, char)= 0x0;
void register_Sender_send_myPort_mChar_listener(void (*_listener)(struct Sender_Instance *, char)){
Sender_send_myPort_mChar_listener = _listener;
}
void Sender_send_myPort_mChar(struct Sender_Instance *_instance, char p){
if (Sender_send_myPort_mChar_listener != 0x0) Sender_send_myPort_mChar_listener(_instance, p);
if (external_Sender_send_myPort_mChar_listener != 0x0) external_Sender_send_myPort_mChar_listener(_instance, p);
;
}
void (*external_Sender_send_myPort_mBoolean_listener)(struct Sender_Instance *, uint8_t)= 0x0;
void register_external_Sender_send_myPort_mBoolean_listener(void (*_listener)(struct Sender_Instance *, uint8_t)){
external_Sender_send_myPort_mBoolean_listener = _listener;
}
void (*Sender_send_myPort_mBoolean_listener)(struct Sender_Instance *, uint8_t)= 0x0;
void register_Sender_send_myPort_mBoolean_listener(void (*_listener)(struct Sender_Instance *, uint8_t)){
Sender_send_myPort_mBoolean_listener = _listener;
}
void Sender_send_myPort_mBoolean(struct Sender_Instance *_instance, uint8_t p){
if (Sender_send_myPort_mBoolean_listener != 0x0) Sender_send_myPort_mBoolean_listener(_instance, p);
if (external_Sender_send_myPort_mBoolean_listener != 0x0) external_Sender_send_myPort_mBoolean_listener(_instance, p);
;
}
void (*external_Sender_send_myPort_mUInt8_listener)(struct Sender_Instance *, uint8_t)= 0x0;
void register_external_Sender_send_myPort_mUInt8_listener(void (*_listener)(struct Sender_Instance *, uint8_t)){
external_Sender_send_myPort_mUInt8_listener = _listener;
}
void (*Sender_send_myPort_mUInt8_listener)(struct Sender_Instance *, uint8_t)= 0x0;
void register_Sender_send_myPort_mUInt8_listener(void (*_listener)(struct Sender_Instance *, uint8_t)){
Sender_send_myPort_mUInt8_listener = _listener;
}
void Sender_send_myPort_mUInt8(struct Sender_Instance *_instance, uint8_t p){
if (Sender_send_myPort_mUInt8_listener != 0x0) Sender_send_myPort_mUInt8_listener(_instance, p);
if (external_Sender_send_myPort_mUInt8_listener != 0x0) external_Sender_send_myPort_mUInt8_listener(_instance, p);
;
}
void (*external_Sender_send_myPort_mUInt16_listener)(struct Sender_Instance *, uint16_t)= 0x0;
void register_external_Sender_send_myPort_mUInt16_listener(void (*_listener)(struct Sender_Instance *, uint16_t)){
external_Sender_send_myPort_mUInt16_listener = _listener;
}
void (*Sender_send_myPort_mUInt16_listener)(struct Sender_Instance *, uint16_t)= 0x0;
void register_Sender_send_myPort_mUInt16_listener(void (*_listener)(struct Sender_Instance *, uint16_t)){
Sender_send_myPort_mUInt16_listener = _listener;
}
void Sender_send_myPort_mUInt16(struct Sender_Instance *_instance, uint16_t p){
if (Sender_send_myPort_mUInt16_listener != 0x0) Sender_send_myPort_mUInt16_listener(_instance, p);
if (external_Sender_send_myPort_mUInt16_listener != 0x0) external_Sender_send_myPort_mUInt16_listener(_instance, p);
;
}
void (*external_Sender_send_myPort_mInt16_listener)(struct Sender_Instance *, int16_t)= 0x0;
void register_external_Sender_send_myPort_mInt16_listener(void (*_listener)(struct Sender_Instance *, int16_t)){
external_Sender_send_myPort_mInt16_listener = _listener;
}
void (*Sender_send_myPort_mInt16_listener)(struct Sender_Instance *, int16_t)= 0x0;
void register_Sender_send_myPort_mInt16_listener(void (*_listener)(struct Sender_Instance *, int16_t)){
Sender_send_myPort_mInt16_listener = _listener;
}
void Sender_send_myPort_mInt16(struct Sender_Instance *_instance, int16_t p){
if (Sender_send_myPort_mInt16_listener != 0x0) Sender_send_myPort_mInt16_listener(_instance, p);
if (external_Sender_send_myPort_mInt16_listener != 0x0) external_Sender_send_myPort_mInt16_listener(_instance, p);
;
}
void (*external_Sender_send_myPort_mUInt32_listener)(struct Sender_Instance *, uint32_t)= 0x0;
void register_external_Sender_send_myPort_mUInt32_listener(void (*_listener)(struct Sender_Instance *, uint32_t)){
external_Sender_send_myPort_mUInt32_listener = _listener;
}
void (*Sender_send_myPort_mUInt32_listener)(struct Sender_Instance *, uint32_t)= 0x0;
void register_Sender_send_myPort_mUInt32_listener(void (*_listener)(struct Sender_Instance *, uint32_t)){
Sender_send_myPort_mUInt32_listener = _listener;
}
void Sender_send_myPort_mUInt32(struct Sender_Instance *_instance, uint32_t p){
if (Sender_send_myPort_mUInt32_listener != 0x0) Sender_send_myPort_mUInt32_listener(_instance, p);
if (external_Sender_send_myPort_mUInt32_listener != 0x0) external_Sender_send_myPort_mUInt32_listener(_instance, p);
;
}
void (*external_Sender_send_myPort_mInteger_listener)(struct Sender_Instance *, int16_t)= 0x0;
void register_external_Sender_send_myPort_mInteger_listener(void (*_listener)(struct Sender_Instance *, int16_t)){
external_Sender_send_myPort_mInteger_listener = _listener;
}
void (*Sender_send_myPort_mInteger_listener)(struct Sender_Instance *, int16_t)= 0x0;
void register_Sender_send_myPort_mInteger_listener(void (*_listener)(struct Sender_Instance *, int16_t)){
Sender_send_myPort_mInteger_listener = _listener;
}
void Sender_send_myPort_mInteger(struct Sender_Instance *_instance, int16_t p){
if (Sender_send_myPort_mInteger_listener != 0x0) Sender_send_myPort_mInteger_listener(_instance, p);
if (external_Sender_send_myPort_mInteger_listener != 0x0) external_Sender_send_myPort_mInteger_listener(_instance, p);
;
}
void (*external_Sender_send_myPort_mLong_listener)(struct Sender_Instance *, long)= 0x0;
void register_external_Sender_send_myPort_mLong_listener(void (*_listener)(struct Sender_Instance *, long)){
external_Sender_send_myPort_mLong_listener = _listener;
}
void (*Sender_send_myPort_mLong_listener)(struct Sender_Instance *, long)= 0x0;
void register_Sender_send_myPort_mLong_listener(void (*_listener)(struct Sender_Instance *, long)){
Sender_send_myPort_mLong_listener = _listener;
}
void Sender_send_myPort_mLong(struct Sender_Instance *_instance, long p){
if (Sender_send_myPort_mLong_listener != 0x0) Sender_send_myPort_mLong_listener(_instance, p);
if (external_Sender_send_myPort_mLong_listener != 0x0) external_Sender_send_myPort_mLong_listener(_instance, p);
;
}
void (*external_Sender_send_myPort_mDouble_listener)(struct Sender_Instance *, double)= 0x0;
void register_external_Sender_send_myPort_mDouble_listener(void (*_listener)(struct Sender_Instance *, double)){
external_Sender_send_myPort_mDouble_listener = _listener;
}
void (*Sender_send_myPort_mDouble_listener)(struct Sender_Instance *, double)= 0x0;
void register_Sender_send_myPort_mDouble_listener(void (*_listener)(struct Sender_Instance *, double)){
Sender_send_myPort_mDouble_listener = _listener;
}
void Sender_send_myPort_mDouble(struct Sender_Instance *_instance, double p){
if (Sender_send_myPort_mDouble_listener != 0x0) Sender_send_myPort_mDouble_listener(_instance, p);
if (external_Sender_send_myPort_mDouble_listener != 0x0) external_Sender_send_myPort_mDouble_listener(_instance, p);
;
}
void (*external_Sender_send_myPort_mFloat_listener)(struct Sender_Instance *, float)= 0x0;
void register_external_Sender_send_myPort_mFloat_listener(void (*_listener)(struct Sender_Instance *, float)){
external_Sender_send_myPort_mFloat_listener = _listener;
}
void (*Sender_send_myPort_mFloat_listener)(struct Sender_Instance *, float)= 0x0;
void register_Sender_send_myPort_mFloat_listener(void (*_listener)(struct Sender_Instance *, float)){
Sender_send_myPort_mFloat_listener = _listener;
}
void Sender_send_myPort_mFloat(struct Sender_Instance *_instance, float p){
if (Sender_send_myPort_mFloat_listener != 0x0) Sender_send_myPort_mFloat_listener(_instance, p);
if (external_Sender_send_myPort_mFloat_listener != 0x0) external_Sender_send_myPort_mFloat_listener(_instance, p);
;
}
void (*external_Sender_send_myPort_mEnum_listener)(struct Sender_Instance *, uint8_t)= 0x0;
void register_external_Sender_send_myPort_mEnum_listener(void (*_listener)(struct Sender_Instance *, uint8_t)){
external_Sender_send_myPort_mEnum_listener = _listener;
}
void (*Sender_send_myPort_mEnum_listener)(struct Sender_Instance *, uint8_t)= 0x0;
void register_Sender_send_myPort_mEnum_listener(void (*_listener)(struct Sender_Instance *, uint8_t)){
Sender_send_myPort_mEnum_listener = _listener;
}
void Sender_send_myPort_mEnum(struct Sender_Instance *_instance, uint8_t p){
if (Sender_send_myPort_mEnum_listener != 0x0) Sender_send_myPort_mEnum_listener(_instance, p);
if (external_Sender_send_myPort_mEnum_listener != 0x0) external_Sender_send_myPort_mEnum_listener(_instance, p);
;
}
void (*external_Sender_send_myPort_mDoubleFloat_listener)(struct Sender_Instance *, float, float)= 0x0;
void register_external_Sender_send_myPort_mDoubleFloat_listener(void (*_listener)(struct Sender_Instance *, float, float)){
external_Sender_send_myPort_mDoubleFloat_listener = _listener;
}
void (*Sender_send_myPort_mDoubleFloat_listener)(struct Sender_Instance *, float, float)= 0x0;
void register_Sender_send_myPort_mDoubleFloat_listener(void (*_listener)(struct Sender_Instance *, float, float)){
Sender_send_myPort_mDoubleFloat_listener = _listener;
}
void Sender_send_myPort_mDoubleFloat(struct Sender_Instance *_instance, float p1, float p2){
if (Sender_send_myPort_mDoubleFloat_listener != 0x0) Sender_send_myPort_mDoubleFloat_listener(_instance, p1, p2);
if (external_Sender_send_myPort_mDoubleFloat_listener != 0x0) external_Sender_send_myPort_mDoubleFloat_listener(_instance, p1, p2);
;
}



