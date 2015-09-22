/*****************************************************
 *      THIS IS A GENERATED FILE. DO NOT EDIT.
 *      Implementation for Application Serialization_test_Cfg
 *  Generated from ThingML (http://www.thingml.org)
 *****************************************************/

#include <unistd.h>
#include <stdlib.h>
#include <stdio.h>
#include <ctype.h>
#include <string.h>
#include <math.h>
#include <signal.h>
#include <pthread.h>
#include "thingml_typedefs.h"
#include "runtime.h"
#include "Receiver.h"
#include "Sender.h"





/*****************************************************************************
 * Definitions for configuration : Serialization_test_Cfg
 *****************************************************************************/

//Declaration of instance variables
struct Receiver_Instance Serialization_test_Cfg_r_var;
struct Sender_Instance Serialization_test_Cfg_s_var;

// Enqueue of messages Sender::myPort::mEnum
void enqueue_Sender_send_myPort_mEnum(struct Sender_Instance *_instance, uint8_t p){
//[]
fifo_lock();
if ( fifo_byte_available() > 5 ) {

_fifo_enqueue( (1 >> 8) & 0xFF );
_fifo_enqueue( 1 & 0xFF );

// ID of the source instance
_fifo_enqueue( (_instance->id >> 8) & 0xFF );
_fifo_enqueue( _instance->id & 0xFF );

// parameter p
union u_p_t {
uint8_t p;
byte bytebuffer[1];
} u_p;
u_p.p = p;
_fifo_enqueue(u_p.bytebuffer[0] & 0xFF);
}
fifo_unlock_and_notify();
}
// Enqueue of messages Sender::myPort::mEmpty
void enqueue_Sender_send_myPort_mEmpty(struct Sender_Instance *_instance){
//[]
fifo_lock();
if ( fifo_byte_available() > 4 ) {

_fifo_enqueue( (2 >> 8) & 0xFF );
_fifo_enqueue( 2 & 0xFF );

// ID of the source instance
_fifo_enqueue( (_instance->id >> 8) & 0xFF );
_fifo_enqueue( _instance->id & 0xFF );
}
fifo_unlock_and_notify();
}
// Enqueue of messages Sender::myPort::mInteger
void enqueue_Sender_send_myPort_mInteger(struct Sender_Instance *_instance, int16_t p){
//[]
fifo_lock();
if ( fifo_byte_available() > 6 ) {

_fifo_enqueue( (3 >> 8) & 0xFF );
_fifo_enqueue( 3 & 0xFF );

// ID of the source instance
_fifo_enqueue( (_instance->id >> 8) & 0xFF );
_fifo_enqueue( _instance->id & 0xFF );

// parameter p
union u_p_t {
int16_t p;
byte bytebuffer[2];
} u_p;
u_p.p = p;
_fifo_enqueue(u_p.bytebuffer[1] & 0xFF);
_fifo_enqueue(u_p.bytebuffer[0] & 0xFF);
}
fifo_unlock_and_notify();
}
// Enqueue of messages Sender::myPort::mUInt32
void enqueue_Sender_send_myPort_mUInt32(struct Sender_Instance *_instance, uint32_t p){
//[]
fifo_lock();
if ( fifo_byte_available() > 8 ) {

_fifo_enqueue( (4 >> 8) & 0xFF );
_fifo_enqueue( 4 & 0xFF );

// ID of the source instance
_fifo_enqueue( (_instance->id >> 8) & 0xFF );
_fifo_enqueue( _instance->id & 0xFF );

// parameter p
union u_p_t {
uint32_t p;
byte bytebuffer[4];
} u_p;
u_p.p = p;
_fifo_enqueue(u_p.bytebuffer[3] & 0xFF);
_fifo_enqueue(u_p.bytebuffer[2] & 0xFF);
_fifo_enqueue(u_p.bytebuffer[1] & 0xFF);
_fifo_enqueue(u_p.bytebuffer[0] & 0xFF);
}
fifo_unlock_and_notify();
}
// Enqueue of messages Sender::myPort::mDoubleFloat
void enqueue_Sender_send_myPort_mDoubleFloat(struct Sender_Instance *_instance, float p1, float p2){
//[]
fifo_lock();
if ( fifo_byte_available() > 12 ) {

_fifo_enqueue( (5 >> 8) & 0xFF );
_fifo_enqueue( 5 & 0xFF );

// ID of the source instance
_fifo_enqueue( (_instance->id >> 8) & 0xFF );
_fifo_enqueue( _instance->id & 0xFF );

// parameter p1
union u_p1_t {
float p;
byte bytebuffer[4];
} u_p1;
u_p1.p = p1;
_fifo_enqueue(u_p1.bytebuffer[3] & 0xFF);
_fifo_enqueue(u_p1.bytebuffer[2] & 0xFF);
_fifo_enqueue(u_p1.bytebuffer[1] & 0xFF);
_fifo_enqueue(u_p1.bytebuffer[0] & 0xFF);

// parameter p2
union u_p2_t {
float p;
byte bytebuffer[4];
} u_p2;
u_p2.p = p2;
_fifo_enqueue(u_p2.bytebuffer[3] & 0xFF);
_fifo_enqueue(u_p2.bytebuffer[2] & 0xFF);
_fifo_enqueue(u_p2.bytebuffer[1] & 0xFF);
_fifo_enqueue(u_p2.bytebuffer[0] & 0xFF);
}
fifo_unlock_and_notify();
}
// Enqueue of messages Sender::myPort::mLong
void enqueue_Sender_send_myPort_mLong(struct Sender_Instance *_instance, long p){
//[]
fifo_lock();
if ( fifo_byte_available() > 8 ) {

_fifo_enqueue( (6 >> 8) & 0xFF );
_fifo_enqueue( 6 & 0xFF );

// ID of the source instance
_fifo_enqueue( (_instance->id >> 8) & 0xFF );
_fifo_enqueue( _instance->id & 0xFF );

// parameter p
union u_p_t {
long p;
byte bytebuffer[4];
} u_p;
u_p.p = p;
_fifo_enqueue(u_p.bytebuffer[3] & 0xFF);
_fifo_enqueue(u_p.bytebuffer[2] & 0xFF);
_fifo_enqueue(u_p.bytebuffer[1] & 0xFF);
_fifo_enqueue(u_p.bytebuffer[0] & 0xFF);
}
fifo_unlock_and_notify();
}
// Enqueue of messages Sender::myPort::mDouble
void enqueue_Sender_send_myPort_mDouble(struct Sender_Instance *_instance, double p){
//[]
fifo_lock();
if ( fifo_byte_available() > 12 ) {

_fifo_enqueue( (7 >> 8) & 0xFF );
_fifo_enqueue( 7 & 0xFF );

// ID of the source instance
_fifo_enqueue( (_instance->id >> 8) & 0xFF );
_fifo_enqueue( _instance->id & 0xFF );

// parameter p
union u_p_t {
double p;
byte bytebuffer[8];
} u_p;
u_p.p = p;
_fifo_enqueue(u_p.bytebuffer[7] & 0xFF);
_fifo_enqueue(u_p.bytebuffer[6] & 0xFF);
_fifo_enqueue(u_p.bytebuffer[5] & 0xFF);
_fifo_enqueue(u_p.bytebuffer[4] & 0xFF);
_fifo_enqueue(u_p.bytebuffer[3] & 0xFF);
_fifo_enqueue(u_p.bytebuffer[2] & 0xFF);
_fifo_enqueue(u_p.bytebuffer[1] & 0xFF);
_fifo_enqueue(u_p.bytebuffer[0] & 0xFF);
}
fifo_unlock_and_notify();
}
// Enqueue of messages Sender::myPort::mInt16
void enqueue_Sender_send_myPort_mInt16(struct Sender_Instance *_instance, int16_t p){
//[]
fifo_lock();
if ( fifo_byte_available() > 6 ) {

_fifo_enqueue( (8 >> 8) & 0xFF );
_fifo_enqueue( 8 & 0xFF );

// ID of the source instance
_fifo_enqueue( (_instance->id >> 8) & 0xFF );
_fifo_enqueue( _instance->id & 0xFF );

// parameter p
union u_p_t {
int16_t p;
byte bytebuffer[2];
} u_p;
u_p.p = p;
_fifo_enqueue(u_p.bytebuffer[1] & 0xFF);
_fifo_enqueue(u_p.bytebuffer[0] & 0xFF);
}
fifo_unlock_and_notify();
}
// Enqueue of messages Sender::myPort::mChar
void enqueue_Sender_send_myPort_mChar(struct Sender_Instance *_instance, char p){
//[]
fifo_lock();
if ( fifo_byte_available() > 5 ) {

_fifo_enqueue( (9 >> 8) & 0xFF );
_fifo_enqueue( 9 & 0xFF );

// ID of the source instance
_fifo_enqueue( (_instance->id >> 8) & 0xFF );
_fifo_enqueue( _instance->id & 0xFF );

// parameter p
union u_p_t {
char p;
byte bytebuffer[1];
} u_p;
u_p.p = p;
_fifo_enqueue(u_p.bytebuffer[0] & 0xFF);
}
fifo_unlock_and_notify();
}
// Enqueue of messages Sender::myPort::mUInt16
void enqueue_Sender_send_myPort_mUInt16(struct Sender_Instance *_instance, uint16_t p){
//[]
fifo_lock();
if ( fifo_byte_available() > 6 ) {

_fifo_enqueue( (10 >> 8) & 0xFF );
_fifo_enqueue( 10 & 0xFF );

// ID of the source instance
_fifo_enqueue( (_instance->id >> 8) & 0xFF );
_fifo_enqueue( _instance->id & 0xFF );

// parameter p
union u_p_t {
uint16_t p;
byte bytebuffer[2];
} u_p;
u_p.p = p;
_fifo_enqueue(u_p.bytebuffer[1] & 0xFF);
_fifo_enqueue(u_p.bytebuffer[0] & 0xFF);
}
fifo_unlock_and_notify();
}
// Enqueue of messages Sender::myPort::mFloat
void enqueue_Sender_send_myPort_mFloat(struct Sender_Instance *_instance, float p){
//[]
fifo_lock();
if ( fifo_byte_available() > 8 ) {

_fifo_enqueue( (11 >> 8) & 0xFF );
_fifo_enqueue( 11 & 0xFF );

// ID of the source instance
_fifo_enqueue( (_instance->id >> 8) & 0xFF );
_fifo_enqueue( _instance->id & 0xFF );

// parameter p
union u_p_t {
float p;
byte bytebuffer[4];
} u_p;
u_p.p = p;
_fifo_enqueue(u_p.bytebuffer[3] & 0xFF);
_fifo_enqueue(u_p.bytebuffer[2] & 0xFF);
_fifo_enqueue(u_p.bytebuffer[1] & 0xFF);
_fifo_enqueue(u_p.bytebuffer[0] & 0xFF);
}
fifo_unlock_and_notify();
}
// Enqueue of messages Sender::myPort::mBoolean
void enqueue_Sender_send_myPort_mBoolean(struct Sender_Instance *_instance, uint8_t p){
//[]
fifo_lock();
if ( fifo_byte_available() > 5 ) {

_fifo_enqueue( (12 >> 8) & 0xFF );
_fifo_enqueue( 12 & 0xFF );

// ID of the source instance
_fifo_enqueue( (_instance->id >> 8) & 0xFF );
_fifo_enqueue( _instance->id & 0xFF );

// parameter p
union u_p_t {
uint8_t p;
byte bytebuffer[1];
} u_p;
u_p.p = p;
_fifo_enqueue(u_p.bytebuffer[0] & 0xFF);
}
fifo_unlock_and_notify();
}
// Enqueue of messages Sender::myPort::mUInt8
void enqueue_Sender_send_myPort_mUInt8(struct Sender_Instance *_instance, uint8_t p){
//[]
fifo_lock();
if ( fifo_byte_available() > 5 ) {

_fifo_enqueue( (13 >> 8) & 0xFF );
_fifo_enqueue( 13 & 0xFF );

// ID of the source instance
_fifo_enqueue( (_instance->id >> 8) & 0xFF );
_fifo_enqueue( _instance->id & 0xFF );

// parameter p
union u_p_t {
uint8_t p;
byte bytebuffer[1];
} u_p;
u_p.p = p;
_fifo_enqueue(u_p.bytebuffer[0] & 0xFF);
}
fifo_unlock_and_notify();
}
// Enqueue of messages Receiver::myPort::ready
void enqueue_Receiver_send_myPort_ready(struct Receiver_Instance *_instance){
//[]
fifo_lock();
if ( fifo_byte_available() > 4 ) {

_fifo_enqueue( (14 >> 8) & 0xFF );
_fifo_enqueue( 14 & 0xFF );

// ID of the source instance
_fifo_enqueue( (_instance->id >> 8) & 0xFF );
_fifo_enqueue( _instance->id & 0xFF );
}
fifo_unlock_and_notify();
}

// Dispatch for messages Sender::myPort::mEnum
void dispatch_Sender_send_myPort_mEnum(struct Sender_Instance *_instance, uint8_t p){
if (_instance == &Serialization_test_Cfg_s_var) {
Receiver_handle_myPort_mEnum(&Serialization_test_Cfg_r_var, p);
}
}
// Dispatch for messages Sender::myPort::mEmpty
void dispatch_Sender_send_myPort_mEmpty(struct Sender_Instance *_instance){
if (_instance == &Serialization_test_Cfg_s_var) {
Receiver_handle_myPort_mEmpty(&Serialization_test_Cfg_r_var);
}
}
// Dispatch for messages Sender::myPort::mInteger
void dispatch_Sender_send_myPort_mInteger(struct Sender_Instance *_instance, int16_t p){
if (_instance == &Serialization_test_Cfg_s_var) {
Receiver_handle_myPort_mInteger(&Serialization_test_Cfg_r_var, p);
}
}
// Dispatch for messages Sender::myPort::mUInt32
void dispatch_Sender_send_myPort_mUInt32(struct Sender_Instance *_instance, uint32_t p){
if (_instance == &Serialization_test_Cfg_s_var) {
Receiver_handle_myPort_mUInt32(&Serialization_test_Cfg_r_var, p);
}
}
// Dispatch for messages Sender::myPort::mDoubleFloat
void dispatch_Sender_send_myPort_mDoubleFloat(struct Sender_Instance *_instance, float p1, float p2){
if (_instance == &Serialization_test_Cfg_s_var) {
Receiver_handle_myPort_mDoubleFloat(&Serialization_test_Cfg_r_var, p1, p2);
}
}
// Dispatch for messages Sender::myPort::mLong
void dispatch_Sender_send_myPort_mLong(struct Sender_Instance *_instance, long p){
if (_instance == &Serialization_test_Cfg_s_var) {
Receiver_handle_myPort_mLong(&Serialization_test_Cfg_r_var, p);
}
}
// Dispatch for messages Sender::myPort::mDouble
void dispatch_Sender_send_myPort_mDouble(struct Sender_Instance *_instance, double p){
if (_instance == &Serialization_test_Cfg_s_var) {
Receiver_handle_myPort_mDouble(&Serialization_test_Cfg_r_var, p);
}
}
// Dispatch for messages Sender::myPort::mInt16
void dispatch_Sender_send_myPort_mInt16(struct Sender_Instance *_instance, int16_t p){
if (_instance == &Serialization_test_Cfg_s_var) {
Receiver_handle_myPort_mInt16(&Serialization_test_Cfg_r_var, p);
}
}
// Dispatch for messages Sender::myPort::mChar
void dispatch_Sender_send_myPort_mChar(struct Sender_Instance *_instance, char p){
if (_instance == &Serialization_test_Cfg_s_var) {
Receiver_handle_myPort_mChar(&Serialization_test_Cfg_r_var, p);
}
}
// Dispatch for messages Sender::myPort::mUInt16
void dispatch_Sender_send_myPort_mUInt16(struct Sender_Instance *_instance, uint16_t p){
if (_instance == &Serialization_test_Cfg_s_var) {
Receiver_handle_myPort_mUInt16(&Serialization_test_Cfg_r_var, p);
}
}
// Dispatch for messages Sender::myPort::mFloat
void dispatch_Sender_send_myPort_mFloat(struct Sender_Instance *_instance, float p){
if (_instance == &Serialization_test_Cfg_s_var) {
Receiver_handle_myPort_mFloat(&Serialization_test_Cfg_r_var, p);
}
}
// Dispatch for messages Sender::myPort::mBoolean
void dispatch_Sender_send_myPort_mBoolean(struct Sender_Instance *_instance, uint8_t p){
if (_instance == &Serialization_test_Cfg_s_var) {
Receiver_handle_myPort_mBoolean(&Serialization_test_Cfg_r_var, p);
}
}
// Dispatch for messages Sender::myPort::mUInt8
void dispatch_Sender_send_myPort_mUInt8(struct Sender_Instance *_instance, uint8_t p){
if (_instance == &Serialization_test_Cfg_s_var) {
Receiver_handle_myPort_mUInt8(&Serialization_test_Cfg_r_var, p);
}
}
// Dispatch for messages Receiver::myPort::ready
void dispatch_Receiver_send_myPort_ready(struct Receiver_Instance *_instance){
if (_instance == &Serialization_test_Cfg_r_var) {
Sender_handle_myPort_ready(&Serialization_test_Cfg_s_var);
}
}

void processMessageQueue() {
fifo_lock();
while (fifo_empty()) fifo_wait();
byte mbuf[10];
uint8_t mbufi = 0;

// Read the code of the next port/message in the queue
uint16_t code = fifo_dequeue() << 8;

code += fifo_dequeue();

// Switch to call the appropriate handler
switch(code) {
case 1:
while (mbufi < 3) mbuf[mbufi++] = fifo_dequeue();
fifo_unlock();
union u_mEnum_p_t {
uint8_t p;
byte bytebuffer[1];
} u_mEnum_p;
u_mEnum_p.bytebuffer[0] = mbuf[2];
dispatch_Sender_send_myPort_mEnum((struct Sender_Instance*)instance_by_id((mbuf[0] << 8) + mbuf[1]) /* instance */,
 u_mEnum_p.p /* p */ );
break;
case 2:
while (mbufi < 2) mbuf[mbufi++] = fifo_dequeue();
fifo_unlock();
dispatch_Sender_send_myPort_mEmpty((struct Sender_Instance*)instance_by_id((mbuf[0] << 8) + mbuf[1]) /* instance */);
break;
case 3:
while (mbufi < 4) mbuf[mbufi++] = fifo_dequeue();
fifo_unlock();
union u_mInteger_p_t {
int16_t p;
byte bytebuffer[2];
} u_mInteger_p;
u_mInteger_p.bytebuffer[1] = mbuf[2];
u_mInteger_p.bytebuffer[0] = mbuf[3];
dispatch_Sender_send_myPort_mInteger((struct Sender_Instance*)instance_by_id((mbuf[0] << 8) + mbuf[1]) /* instance */,
 u_mInteger_p.p /* p */ );
break;
case 4:
while (mbufi < 6) mbuf[mbufi++] = fifo_dequeue();
fifo_unlock();
union u_mUInt32_p_t {
uint32_t p;
byte bytebuffer[4];
} u_mUInt32_p;
u_mUInt32_p.bytebuffer[3] = mbuf[2];
u_mUInt32_p.bytebuffer[2] = mbuf[3];
u_mUInt32_p.bytebuffer[1] = mbuf[4];
u_mUInt32_p.bytebuffer[0] = mbuf[5];
dispatch_Sender_send_myPort_mUInt32((struct Sender_Instance*)instance_by_id((mbuf[0] << 8) + mbuf[1]) /* instance */,
 u_mUInt32_p.p /* p */ );
break;
case 5:
while (mbufi < 10) mbuf[mbufi++] = fifo_dequeue();
fifo_unlock();
union u_mDoubleFloat_p1_t {
float p;
byte bytebuffer[4];
} u_mDoubleFloat_p1;
u_mDoubleFloat_p1.bytebuffer[3] = mbuf[2];
u_mDoubleFloat_p1.bytebuffer[2] = mbuf[3];
u_mDoubleFloat_p1.bytebuffer[1] = mbuf[4];
u_mDoubleFloat_p1.bytebuffer[0] = mbuf[5];
union u_mDoubleFloat_p2_t {
float p;
byte bytebuffer[4];
} u_mDoubleFloat_p2;
u_mDoubleFloat_p2.bytebuffer[3] = mbuf[6];
u_mDoubleFloat_p2.bytebuffer[2] = mbuf[7];
u_mDoubleFloat_p2.bytebuffer[1] = mbuf[8];
u_mDoubleFloat_p2.bytebuffer[0] = mbuf[9];
dispatch_Sender_send_myPort_mDoubleFloat((struct Sender_Instance*)instance_by_id((mbuf[0] << 8) + mbuf[1]) /* instance */,
 u_mDoubleFloat_p1.p /* p1 */ ,
 u_mDoubleFloat_p2.p /* p2 */ );
break;
case 6:
while (mbufi < 6) mbuf[mbufi++] = fifo_dequeue();
fifo_unlock();
union u_mLong_p_t {
long p;
byte bytebuffer[4];
} u_mLong_p;
u_mLong_p.bytebuffer[3] = mbuf[2];
u_mLong_p.bytebuffer[2] = mbuf[3];
u_mLong_p.bytebuffer[1] = mbuf[4];
u_mLong_p.bytebuffer[0] = mbuf[5];
dispatch_Sender_send_myPort_mLong((struct Sender_Instance*)instance_by_id((mbuf[0] << 8) + mbuf[1]) /* instance */,
 u_mLong_p.p /* p */ );
break;
case 7:
while (mbufi < 10) mbuf[mbufi++] = fifo_dequeue();
fifo_unlock();
union u_mDouble_p_t {
double p;
byte bytebuffer[8];
} u_mDouble_p;
u_mDouble_p.bytebuffer[7] = mbuf[2];
u_mDouble_p.bytebuffer[6] = mbuf[3];
u_mDouble_p.bytebuffer[5] = mbuf[4];
u_mDouble_p.bytebuffer[4] = mbuf[5];
u_mDouble_p.bytebuffer[3] = mbuf[6];
u_mDouble_p.bytebuffer[2] = mbuf[7];
u_mDouble_p.bytebuffer[1] = mbuf[8];
u_mDouble_p.bytebuffer[0] = mbuf[9];
dispatch_Sender_send_myPort_mDouble((struct Sender_Instance*)instance_by_id((mbuf[0] << 8) + mbuf[1]) /* instance */,
 u_mDouble_p.p /* p */ );
break;
case 8:
while (mbufi < 4) mbuf[mbufi++] = fifo_dequeue();
fifo_unlock();
union u_mInt16_p_t {
int16_t p;
byte bytebuffer[2];
} u_mInt16_p;
u_mInt16_p.bytebuffer[1] = mbuf[2];
u_mInt16_p.bytebuffer[0] = mbuf[3];
dispatch_Sender_send_myPort_mInt16((struct Sender_Instance*)instance_by_id((mbuf[0] << 8) + mbuf[1]) /* instance */,
 u_mInt16_p.p /* p */ );
break;
case 9:
while (mbufi < 3) mbuf[mbufi++] = fifo_dequeue();
fifo_unlock();
union u_mChar_p_t {
char p;
byte bytebuffer[1];
} u_mChar_p;
u_mChar_p.bytebuffer[0] = mbuf[2];
dispatch_Sender_send_myPort_mChar((struct Sender_Instance*)instance_by_id((mbuf[0] << 8) + mbuf[1]) /* instance */,
 u_mChar_p.p /* p */ );
break;
case 10:
while (mbufi < 4) mbuf[mbufi++] = fifo_dequeue();
fifo_unlock();
union u_mUInt16_p_t {
uint16_t p;
byte bytebuffer[2];
} u_mUInt16_p;
u_mUInt16_p.bytebuffer[1] = mbuf[2];
u_mUInt16_p.bytebuffer[0] = mbuf[3];
dispatch_Sender_send_myPort_mUInt16((struct Sender_Instance*)instance_by_id((mbuf[0] << 8) + mbuf[1]) /* instance */,
 u_mUInt16_p.p /* p */ );
break;
case 11:
while (mbufi < 6) mbuf[mbufi++] = fifo_dequeue();
fifo_unlock();
union u_mFloat_p_t {
float p;
byte bytebuffer[4];
} u_mFloat_p;
u_mFloat_p.bytebuffer[3] = mbuf[2];
u_mFloat_p.bytebuffer[2] = mbuf[3];
u_mFloat_p.bytebuffer[1] = mbuf[4];
u_mFloat_p.bytebuffer[0] = mbuf[5];
dispatch_Sender_send_myPort_mFloat((struct Sender_Instance*)instance_by_id((mbuf[0] << 8) + mbuf[1]) /* instance */,
 u_mFloat_p.p /* p */ );
break;
case 12:
while (mbufi < 3) mbuf[mbufi++] = fifo_dequeue();
fifo_unlock();
union u_mBoolean_p_t {
uint8_t p;
byte bytebuffer[1];
} u_mBoolean_p;
u_mBoolean_p.bytebuffer[0] = mbuf[2];
dispatch_Sender_send_myPort_mBoolean((struct Sender_Instance*)instance_by_id((mbuf[0] << 8) + mbuf[1]) /* instance */,
 u_mBoolean_p.p /* p */ );
break;
case 13:
while (mbufi < 3) mbuf[mbufi++] = fifo_dequeue();
fifo_unlock();
union u_mUInt8_p_t {
uint8_t p;
byte bytebuffer[1];
} u_mUInt8_p;
u_mUInt8_p.bytebuffer[0] = mbuf[2];
dispatch_Sender_send_myPort_mUInt8((struct Sender_Instance*)instance_by_id((mbuf[0] << 8) + mbuf[1]) /* instance */,
 u_mUInt8_p.p /* p */ );
break;
case 14:
while (mbufi < 2) mbuf[mbufi++] = fifo_dequeue();
fifo_unlock();
dispatch_Receiver_send_myPort_ready((struct Receiver_Instance*)instance_by_id((mbuf[0] << 8) + mbuf[1]) /* instance */);
break;
}
}

void initialize_configuration_Serialization_test_Cfg() {
// Initialize connectors
register_Sender_send_myPort_mEmpty_listener(enqueue_Sender_send_myPort_mEmpty);
register_Sender_send_myPort_mChar_listener(enqueue_Sender_send_myPort_mChar);
register_Sender_send_myPort_mBoolean_listener(enqueue_Sender_send_myPort_mBoolean);
register_Sender_send_myPort_mUInt8_listener(enqueue_Sender_send_myPort_mUInt8);
register_Sender_send_myPort_mUInt16_listener(enqueue_Sender_send_myPort_mUInt16);
register_Sender_send_myPort_mInt16_listener(enqueue_Sender_send_myPort_mInt16);
register_Sender_send_myPort_mUInt32_listener(enqueue_Sender_send_myPort_mUInt32);
register_Sender_send_myPort_mInteger_listener(enqueue_Sender_send_myPort_mInteger);
register_Sender_send_myPort_mLong_listener(enqueue_Sender_send_myPort_mLong);
register_Sender_send_myPort_mDouble_listener(enqueue_Sender_send_myPort_mDouble);
register_Sender_send_myPort_mFloat_listener(enqueue_Sender_send_myPort_mFloat);
register_Sender_send_myPort_mEnum_listener(enqueue_Sender_send_myPort_mEnum);
register_Sender_send_myPort_mDoubleFloat_listener(enqueue_Sender_send_myPort_mDoubleFloat);
register_Receiver_send_myPort_ready_listener(enqueue_Receiver_send_myPort_ready);

// Init the ID, state variables and properties for instance Serialization_test_Cfg_s
Serialization_test_Cfg_s_var.id = add_instance( (void*) &Serialization_test_Cfg_s_var);
Serialization_test_Cfg_s_var.Sender_SenderChart_State = SENDER_SENDERCHART_INIT_STATE;

// Init the ID, state variables and properties for instance Serialization_test_Cfg_r
Serialization_test_Cfg_r_var.id = add_instance( (void*) &Serialization_test_Cfg_r_var);
Serialization_test_Cfg_r_var.Receiver_SenderChart_State = RECEIVER_SENDERCHART_INIT_STATE;

Sender_SenderChart_OnEntry(SENDER_SENDERCHART_STATE, &Serialization_test_Cfg_s_var);
Receiver_SenderChart_OnEntry(RECEIVER_SENDERCHART_STATE, &Serialization_test_Cfg_r_var);
}




int main(int argc, char *argv[]) {
  init_runtime();
  
  initialize_configuration_Serialization_test_Cfg();

  while (1) {
    Sender_handle_empty_event(&Serialization_test_Cfg_s_var);

    processMessageQueue();
  }
}