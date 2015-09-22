/*****************************************************
 *      THIS IS A GENERATED FILE. DO NOT EDIT.
 *      Implementation for Application dynButtonControllerCfg
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
#include "ButtonController.h"
#include "bc_Bridge_Serial1.h"
#include "bc_WS_Websocket.h"





/*****************************************************************************
 * Definitions for configuration : dynButtonControllerCfg
 *****************************************************************************/

//Declaration of connexion array
#define NB_MAX_CONNEXION 16
struct Msg_Handler * dynButtonControllerCfg_receivers[NB_MAX_CONNEXION];

//Declaration of instance variables
//Instance dynButtonControllerCfg_bc
struct ButtonController_Instance dynButtonControllerCfg_bc_var;
struct Msg_Handler dynButtonControllerCfg_bc_Bridge_handlers;
uint16_t dynButtonControllerCfg_bc_Bridge_msgs[4];
void * dynButtonControllerCfg_bc_Bridge_handlers_tab[4];

struct Msg_Handler dynButtonControllerCfg_bc_WS_handlers;
uint16_t dynButtonControllerCfg_bc_WS_msgs[6];
void * dynButtonControllerCfg_bc_WS_handlers_tab[6];

struct Msg_Handler dynButtonControllerCfg_bc_Green_handlers;
uint16_t dynButtonControllerCfg_bc_Green_msgs[4];
void * dynButtonControllerCfg_bc_Green_handlers_tab[4];

struct Msg_Handler dynButtonControllerCfg_bc_Blue_handlers;
uint16_t dynButtonControllerCfg_bc_Blue_msgs[4];
void * dynButtonControllerCfg_bc_Blue_handlers_tab[4];

struct Msg_Handler dynButtonControllerCfg_bc_Uno_handlers;
uint16_t dynButtonControllerCfg_bc_Uno_msgs[1];
void * dynButtonControllerCfg_bc_Uno_handlers_tab[1];

struct Msg_Handler dynButtonControllerCfg_bc_Due_handlers;
uint16_t dynButtonControllerCfg_bc_Due_msgs[1];
void * dynButtonControllerCfg_bc_Due_handlers_tab[1];


// Enqueue of messages ButtonController::Green::Useless
void enqueue_ButtonController_send_Green_Useless(struct ButtonController_Instance *_instance){
fifo_lock();
if ( fifo_byte_available() > 4 ) {

_fifo_enqueue( (100 >> 8) & 0xFF );
_fifo_enqueue( 100 & 0xFF );

// ID of the source port of the instance
_fifo_enqueue( (_instance->id_Green >> 8) & 0xFF );
_fifo_enqueue( _instance->id_Green & 0xFF );
}
fifo_unlock_and_notify();
}
// Enqueue of messages ButtonController::Blue::Useless
void enqueue_ButtonController_send_Blue_Useless(struct ButtonController_Instance *_instance){
fifo_lock();
if ( fifo_byte_available() > 4 ) {

_fifo_enqueue( (100 >> 8) & 0xFF );
_fifo_enqueue( 100 & 0xFF );

// ID of the source port of the instance
_fifo_enqueue( (_instance->id_Blue >> 8) & 0xFF );
_fifo_enqueue( _instance->id_Blue & 0xFF );
}
fifo_unlock_and_notify();
}
// Enqueue of messages ButtonController::Uno::DueOFF
void enqueue_ButtonController_send_Uno_DueOFF(struct ButtonController_Instance *_instance){
fifo_lock();
if ( fifo_byte_available() > 4 ) {

_fifo_enqueue( (91 >> 8) & 0xFF );
_fifo_enqueue( 91 & 0xFF );

// ID of the source port of the instance
_fifo_enqueue( (_instance->id_Uno >> 8) & 0xFF );
_fifo_enqueue( _instance->id_Uno & 0xFF );
}
fifo_unlock_and_notify();
}
// Enqueue of messages ButtonController::Uno::UnoOFF
void enqueue_ButtonController_send_Uno_UnoOFF(struct ButtonController_Instance *_instance){
fifo_lock();
if ( fifo_byte_available() > 4 ) {

_fifo_enqueue( (81 >> 8) & 0xFF );
_fifo_enqueue( 81 & 0xFF );

// ID of the source port of the instance
_fifo_enqueue( (_instance->id_Uno >> 8) & 0xFF );
_fifo_enqueue( _instance->id_Uno & 0xFF );
}
fifo_unlock_and_notify();
}
// Enqueue of messages ButtonController::Uno::UnoON
void enqueue_ButtonController_send_Uno_UnoON(struct ButtonController_Instance *_instance){
fifo_lock();
if ( fifo_byte_available() > 4 ) {

_fifo_enqueue( (80 >> 8) & 0xFF );
_fifo_enqueue( 80 & 0xFF );

// ID of the source port of the instance
_fifo_enqueue( (_instance->id_Uno >> 8) & 0xFF );
_fifo_enqueue( _instance->id_Uno & 0xFF );
}
fifo_unlock_and_notify();
}
// Enqueue of messages ButtonController::Uno::DueON
void enqueue_ButtonController_send_Uno_DueON(struct ButtonController_Instance *_instance){
fifo_lock();
if ( fifo_byte_available() > 4 ) {

_fifo_enqueue( (90 >> 8) & 0xFF );
_fifo_enqueue( 90 & 0xFF );

// ID of the source port of the instance
_fifo_enqueue( (_instance->id_Uno >> 8) & 0xFF );
_fifo_enqueue( _instance->id_Uno & 0xFF );
}
fifo_unlock_and_notify();
}
// Enqueue of messages ButtonController::Due::DueOFF
void enqueue_ButtonController_send_Due_DueOFF(struct ButtonController_Instance *_instance){
fifo_lock();
if ( fifo_byte_available() > 4 ) {

_fifo_enqueue( (91 >> 8) & 0xFF );
_fifo_enqueue( 91 & 0xFF );

// ID of the source port of the instance
_fifo_enqueue( (_instance->id_Due >> 8) & 0xFF );
_fifo_enqueue( _instance->id_Due & 0xFF );
}
fifo_unlock_and_notify();
}
// Enqueue of messages ButtonController::Due::UnoOFF
void enqueue_ButtonController_send_Due_UnoOFF(struct ButtonController_Instance *_instance){
fifo_lock();
if ( fifo_byte_available() > 4 ) {

_fifo_enqueue( (81 >> 8) & 0xFF );
_fifo_enqueue( 81 & 0xFF );

// ID of the source port of the instance
_fifo_enqueue( (_instance->id_Due >> 8) & 0xFF );
_fifo_enqueue( _instance->id_Due & 0xFF );
}
fifo_unlock_and_notify();
}
// Enqueue of messages ButtonController::Due::UnoON
void enqueue_ButtonController_send_Due_UnoON(struct ButtonController_Instance *_instance){
fifo_lock();
if ( fifo_byte_available() > 4 ) {

_fifo_enqueue( (80 >> 8) & 0xFF );
_fifo_enqueue( 80 & 0xFF );

// ID of the source port of the instance
_fifo_enqueue( (_instance->id_Due >> 8) & 0xFF );
_fifo_enqueue( _instance->id_Due & 0xFF );
}
fifo_unlock_and_notify();
}
// Enqueue of messages ButtonController::Due::DueON
void enqueue_ButtonController_send_Due_DueON(struct ButtonController_Instance *_instance){
fifo_lock();
if ( fifo_byte_available() > 4 ) {

_fifo_enqueue( (90 >> 8) & 0xFF );
_fifo_enqueue( 90 & 0xFF );

// ID of the source port of the instance
_fifo_enqueue( (_instance->id_Due >> 8) & 0xFF );
_fifo_enqueue( _instance->id_Due & 0xFF );
}
fifo_unlock_and_notify();
}


//Dynamic dispatcher for message DueOFF
void dispatch_DueOFF(uint16_t sender) {
void executor_dispatch_DueOFF(struct Msg_Handler ** head, struct Msg_Handler ** tail) {
struct Msg_Handler ** cur = head;
while (cur != NULL) {
   void (*handler)(void *) = NULL;
   int i;
   for(i = 0; i < (**cur).nb_msg; i++) {
       if((**cur).msg[i] == 91) {
           handler = (void (*) (void *)) (**cur).msg_handler[i];
           break;
       }
   }
   if(handler != NULL) {
       handler((**cur).instance);
}
   if(cur == tail){
       cur = NULL;}
   else {
   cur++;}
}
}
if (sender == dynButtonControllerCfg_bc_var.id_Due) {
executor_dispatch_DueOFF(dynButtonControllerCfg_bc_var.Due_receiver_list_head, dynButtonControllerCfg_bc_var.Due_receiver_list_tail);}
if (sender == dynButtonControllerCfg_bc_var.id_WS) {
executor_dispatch_DueOFF(dynButtonControllerCfg_bc_var.WS_receiver_list_head, dynButtonControllerCfg_bc_var.WS_receiver_list_tail);}
if (sender == dynButtonControllerCfg_bc_var.id_Uno) {
executor_dispatch_DueOFF(dynButtonControllerCfg_bc_var.Uno_receiver_list_head, dynButtonControllerCfg_bc_var.Uno_receiver_list_tail);}
if (sender == Websocket_instance.listener_id) {
executor_dispatch_DueOFF(Websocket_instance.WS_receiver_list_head,Websocket_instance.WS_receiver_list_tail);}
if (sender == Serial1_instance.listener_id) {
executor_dispatch_DueOFF(Serial1_instance.Bridge_receiver_list_head,Serial1_instance.Bridge_receiver_list_tail);}
}

//Dynamic dispatcher for message connect
void dispatch_connect(uint16_t sender, uint16_t param_p1, uint16_t param_p2) {
void executor_dispatch_connect(struct Msg_Handler ** head, struct Msg_Handler ** tail) {
struct Msg_Handler ** cur = head;
while (cur != NULL) {
   void (*handler)(void *, uint16_t param_p1, uint16_t param_p2) = NULL;
   int i;
   for(i = 0; i < (**cur).nb_msg; i++) {
       if((**cur).msg[i] == 1) {
           handler = (void (*) (void *, uint16_t, uint16_t)) (**cur).msg_handler[i];
           break;
       }
   }
   if(handler != NULL) {
       handler((**cur).instance, param_p1, param_p2);
}
   if(cur == tail){
       cur = NULL;}
   else {
   cur++;}
}
}
if (sender == Websocket_instance.listener_id) {
executor_dispatch_connect(Websocket_instance.WS_receiver_list_head,Websocket_instance.WS_receiver_list_tail);}
}

//Dynamic dispatcher for message UnoOFF
void dispatch_UnoOFF(uint16_t sender) {
void executor_dispatch_UnoOFF(struct Msg_Handler ** head, struct Msg_Handler ** tail) {
struct Msg_Handler ** cur = head;
while (cur != NULL) {
   void (*handler)(void *) = NULL;
   int i;
   for(i = 0; i < (**cur).nb_msg; i++) {
       if((**cur).msg[i] == 81) {
           handler = (void (*) (void *)) (**cur).msg_handler[i];
           break;
       }
   }
   if(handler != NULL) {
       handler((**cur).instance);
}
   if(cur == tail){
       cur = NULL;}
   else {
   cur++;}
}
}
if (sender == dynButtonControllerCfg_bc_var.id_WS) {
executor_dispatch_UnoOFF(dynButtonControllerCfg_bc_var.WS_receiver_list_head, dynButtonControllerCfg_bc_var.WS_receiver_list_tail);}
if (sender == dynButtonControllerCfg_bc_var.id_Uno) {
executor_dispatch_UnoOFF(dynButtonControllerCfg_bc_var.Uno_receiver_list_head, dynButtonControllerCfg_bc_var.Uno_receiver_list_tail);}
if (sender == dynButtonControllerCfg_bc_var.id_Due) {
executor_dispatch_UnoOFF(dynButtonControllerCfg_bc_var.Due_receiver_list_head, dynButtonControllerCfg_bc_var.Due_receiver_list_tail);}
if (sender == Websocket_instance.listener_id) {
executor_dispatch_UnoOFF(Websocket_instance.WS_receiver_list_head,Websocket_instance.WS_receiver_list_tail);}
if (sender == Serial1_instance.listener_id) {
executor_dispatch_UnoOFF(Serial1_instance.Bridge_receiver_list_head,Serial1_instance.Bridge_receiver_list_tail);}
}

//Dynamic dispatcher for message UnoON
void dispatch_UnoON(uint16_t sender) {
void executor_dispatch_UnoON(struct Msg_Handler ** head, struct Msg_Handler ** tail) {
struct Msg_Handler ** cur = head;
while (cur != NULL) {
   void (*handler)(void *) = NULL;
   int i;
   for(i = 0; i < (**cur).nb_msg; i++) {
       if((**cur).msg[i] == 80) {
           handler = (void (*) (void *)) (**cur).msg_handler[i];
           break;
       }
   }
   if(handler != NULL) {
       handler((**cur).instance);
}
   if(cur == tail){
       cur = NULL;}
   else {
   cur++;}
}
}
if (sender == dynButtonControllerCfg_bc_var.id_Due) {
executor_dispatch_UnoON(dynButtonControllerCfg_bc_var.Due_receiver_list_head, dynButtonControllerCfg_bc_var.Due_receiver_list_tail);}
if (sender == dynButtonControllerCfg_bc_var.id_WS) {
executor_dispatch_UnoON(dynButtonControllerCfg_bc_var.WS_receiver_list_head, dynButtonControllerCfg_bc_var.WS_receiver_list_tail);}
if (sender == dynButtonControllerCfg_bc_var.id_Uno) {
executor_dispatch_UnoON(dynButtonControllerCfg_bc_var.Uno_receiver_list_head, dynButtonControllerCfg_bc_var.Uno_receiver_list_tail);}
if (sender == Websocket_instance.listener_id) {
executor_dispatch_UnoON(Websocket_instance.WS_receiver_list_head,Websocket_instance.WS_receiver_list_tail);}
if (sender == Serial1_instance.listener_id) {
executor_dispatch_UnoON(Serial1_instance.Bridge_receiver_list_head,Serial1_instance.Bridge_receiver_list_tail);}
}

//Dynamic dispatcher for message Useless
void dispatch_Useless(uint16_t sender) {
void executor_dispatch_Useless(struct Msg_Handler ** head, struct Msg_Handler ** tail) {
struct Msg_Handler ** cur = head;
while (cur != NULL) {
   void (*handler)(void *) = NULL;
   int i;
   for(i = 0; i < (**cur).nb_msg; i++) {
       if((**cur).msg[i] == 100) {
           handler = (void (*) (void *)) (**cur).msg_handler[i];
           break;
       }
   }
   if(handler != NULL) {
       handler((**cur).instance);
}
   if(cur == tail){
       cur = NULL;}
   else {
   cur++;}
}
}
if (sender == dynButtonControllerCfg_bc_var.id_Green) {
executor_dispatch_Useless(dynButtonControllerCfg_bc_var.Green_receiver_list_head, dynButtonControllerCfg_bc_var.Green_receiver_list_tail);}
if (sender == dynButtonControllerCfg_bc_var.id_Blue) {
executor_dispatch_Useless(dynButtonControllerCfg_bc_var.Blue_receiver_list_head, dynButtonControllerCfg_bc_var.Blue_receiver_list_tail);}
}

//Dynamic dispatcher for message deconnect
void dispatch_deconnect(uint16_t sender, uint16_t param_p1, uint16_t param_p2) {
void executor_dispatch_deconnect(struct Msg_Handler ** head, struct Msg_Handler ** tail) {
struct Msg_Handler ** cur = head;
while (cur != NULL) {
   void (*handler)(void *, uint16_t param_p1, uint16_t param_p2) = NULL;
   int i;
   for(i = 0; i < (**cur).nb_msg; i++) {
       if((**cur).msg[i] == 2) {
           handler = (void (*) (void *, uint16_t, uint16_t)) (**cur).msg_handler[i];
           break;
       }
   }
   if(handler != NULL) {
       handler((**cur).instance, param_p1, param_p2);
}
   if(cur == tail){
       cur = NULL;}
   else {
   cur++;}
}
}
if (sender == Websocket_instance.listener_id) {
executor_dispatch_deconnect(Websocket_instance.WS_receiver_list_head,Websocket_instance.WS_receiver_list_tail);}
}

//Dynamic dispatcher for message DueON
void dispatch_DueON(uint16_t sender) {
void executor_dispatch_DueON(struct Msg_Handler ** head, struct Msg_Handler ** tail) {
struct Msg_Handler ** cur = head;
while (cur != NULL) {
   void (*handler)(void *) = NULL;
   int i;
   for(i = 0; i < (**cur).nb_msg; i++) {
       if((**cur).msg[i] == 90) {
           handler = (void (*) (void *)) (**cur).msg_handler[i];
           break;
       }
   }
   if(handler != NULL) {
       handler((**cur).instance);
}
   if(cur == tail){
       cur = NULL;}
   else {
   cur++;}
}
}
if (sender == dynButtonControllerCfg_bc_var.id_Due) {
executor_dispatch_DueON(dynButtonControllerCfg_bc_var.Due_receiver_list_head, dynButtonControllerCfg_bc_var.Due_receiver_list_tail);}
if (sender == dynButtonControllerCfg_bc_var.id_Uno) {
executor_dispatch_DueON(dynButtonControllerCfg_bc_var.Uno_receiver_list_head, dynButtonControllerCfg_bc_var.Uno_receiver_list_tail);}
if (sender == dynButtonControllerCfg_bc_var.id_WS) {
executor_dispatch_DueON(dynButtonControllerCfg_bc_var.WS_receiver_list_head, dynButtonControllerCfg_bc_var.WS_receiver_list_tail);}
if (sender == Websocket_instance.listener_id) {
executor_dispatch_DueON(Websocket_instance.WS_receiver_list_head,Websocket_instance.WS_receiver_list_tail);}
if (sender == Serial1_instance.listener_id) {
executor_dispatch_DueON(Serial1_instance.Bridge_receiver_list_head,Serial1_instance.Bridge_receiver_list_tail);}
}

void processMessageQueue() {
fifo_lock();
while (fifo_empty()) fifo_wait();
byte mbuf[6];
uint8_t mbufi = 0;

// Read the code of the next port/message in the queue
uint16_t code = fifo_dequeue() << 8;

code += fifo_dequeue();

// Switch to call the appropriate handler
switch(code) {
case 91:
while (mbufi < 2) mbuf[mbufi++] = fifo_dequeue();
fifo_unlock();
dispatch_DueOFF((mbuf[0] << 8) + mbuf[1] /* instance port*/);
break;
case 1:
while (mbufi < 6) mbuf[mbufi++] = fifo_dequeue();
fifo_unlock();
union u_connect_p1_t {
uint16_t p;
byte bytebuffer[2];
} u_connect_p1;
u_connect_p1.bytebuffer[1] = mbuf[2];
u_connect_p1.bytebuffer[0] = mbuf[3];
union u_connect_p2_t {
uint16_t p;
byte bytebuffer[2];
} u_connect_p2;
u_connect_p2.bytebuffer[1] = mbuf[4];
u_connect_p2.bytebuffer[0] = mbuf[5];
dispatch_connect((mbuf[0] << 8) + mbuf[1] /* instance port*/,
 u_connect_p1.p /* p1 */ ,
 u_connect_p2.p /* p2 */ );
break;
case 81:
while (mbufi < 2) mbuf[mbufi++] = fifo_dequeue();
fifo_unlock();
dispatch_UnoOFF((mbuf[0] << 8) + mbuf[1] /* instance port*/);
break;
case 80:
while (mbufi < 2) mbuf[mbufi++] = fifo_dequeue();
fifo_unlock();
dispatch_UnoON((mbuf[0] << 8) + mbuf[1] /* instance port*/);
break;
case 100:
while (mbufi < 2) mbuf[mbufi++] = fifo_dequeue();
fifo_unlock();
dispatch_Useless((mbuf[0] << 8) + mbuf[1] /* instance port*/);
break;
case 2:
while (mbufi < 6) mbuf[mbufi++] = fifo_dequeue();
fifo_unlock();
union u_deconnect_p1_t {
uint16_t p;
byte bytebuffer[2];
} u_deconnect_p1;
u_deconnect_p1.bytebuffer[1] = mbuf[2];
u_deconnect_p1.bytebuffer[0] = mbuf[3];
union u_deconnect_p2_t {
uint16_t p;
byte bytebuffer[2];
} u_deconnect_p2;
u_deconnect_p2.bytebuffer[1] = mbuf[4];
u_deconnect_p2.bytebuffer[0] = mbuf[5];
dispatch_deconnect((mbuf[0] << 8) + mbuf[1] /* instance port*/,
 u_deconnect_p1.p /* p1 */ ,
 u_deconnect_p2.p /* p2 */ );
break;
case 90:
while (mbufi < 2) mbuf[mbufi++] = fifo_dequeue();
fifo_unlock();
dispatch_DueON((mbuf[0] << 8) + mbuf[1] /* instance port*/);
break;
}
}

// Forwarding of messages ButtonController::Bridge::GreenON
void forward_ButtonController_send_Bridge_GreenON(struct ButtonController_Instance *_instance){
byte forward_buf[2];
forward_buf[0] = (60 >> 8) & 0xFF;
forward_buf[1] =  60 & 0xFF;


//Forwarding with specified function 
Serial1_forwardMessage(forward_buf, 2);
}

// Forwarding of messages ButtonController::Bridge::GreenOFF
void forward_ButtonController_send_Bridge_GreenOFF(struct ButtonController_Instance *_instance){
byte forward_buf[2];
forward_buf[0] = (61 >> 8) & 0xFF;
forward_buf[1] =  61 & 0xFF;


//Forwarding with specified function 
Serial1_forwardMessage(forward_buf, 2);
}

// Forwarding of messages ButtonController::Bridge::BlueON
void forward_ButtonController_send_Bridge_BlueON(struct ButtonController_Instance *_instance){
byte forward_buf[2];
forward_buf[0] = (70 >> 8) & 0xFF;
forward_buf[1] =  70 & 0xFF;


//Forwarding with specified function 
Serial1_forwardMessage(forward_buf, 2);
}

// Forwarding of messages ButtonController::Bridge::BlueOFF
void forward_ButtonController_send_Bridge_BlueOFF(struct ButtonController_Instance *_instance){
byte forward_buf[2];
forward_buf[0] = (71 >> 8) & 0xFF;
forward_buf[1] =  71 & 0xFF;


//Forwarding with specified function 
Serial1_forwardMessage(forward_buf, 2);
}

// Forwarding of messages ButtonController::WS::GreenON
void forward_ButtonController_send_WS_GreenON(struct ButtonController_Instance *_instance){
byte forward_buf[2];
forward_buf[0] = (60 >> 8) & 0xFF;
forward_buf[1] =  60 & 0xFF;


//Forwarding with specified function 
Websocket_forwardMessage(forward_buf, 2);
}

// Forwarding of messages ButtonController::WS::GreenOFF
void forward_ButtonController_send_WS_GreenOFF(struct ButtonController_Instance *_instance){
byte forward_buf[2];
forward_buf[0] = (61 >> 8) & 0xFF;
forward_buf[1] =  61 & 0xFF;


//Forwarding with specified function 
Websocket_forwardMessage(forward_buf, 2);
}

// Forwarding of messages ButtonController::WS::BlueON
void forward_ButtonController_send_WS_BlueON(struct ButtonController_Instance *_instance){
byte forward_buf[2];
forward_buf[0] = (70 >> 8) & 0xFF;
forward_buf[1] =  70 & 0xFF;


//Forwarding with specified function 
Websocket_forwardMessage(forward_buf, 2);
}

// Forwarding of messages ButtonController::WS::BlueOFF
void forward_ButtonController_send_WS_BlueOFF(struct ButtonController_Instance *_instance){
byte forward_buf[2];
forward_buf[0] = (71 >> 8) & 0xFF;
forward_buf[1] =  71 & 0xFF;


//Forwarding with specified function 
Websocket_forwardMessage(forward_buf, 2);
}

// Forwarding of messages ButtonController::WS::UnoON
void forward_ButtonController_send_WS_UnoON(struct ButtonController_Instance *_instance){
byte forward_buf[2];
forward_buf[0] = (80 >> 8) & 0xFF;
forward_buf[1] =  80 & 0xFF;


//Forwarding with specified function 
Websocket_forwardMessage(forward_buf, 2);
}

// Forwarding of messages ButtonController::WS::UnoOFF
void forward_ButtonController_send_WS_UnoOFF(struct ButtonController_Instance *_instance){
byte forward_buf[2];
forward_buf[0] = (81 >> 8) & 0xFF;
forward_buf[1] =  81 & 0xFF;


//Forwarding with specified function 
Websocket_forwardMessage(forward_buf, 2);
}

// Forwarding of messages ButtonController::WS::DueON
void forward_ButtonController_send_WS_DueON(struct ButtonController_Instance *_instance){
byte forward_buf[2];
forward_buf[0] = (90 >> 8) & 0xFF;
forward_buf[1] =  90 & 0xFF;


//Forwarding with specified function 
Websocket_forwardMessage(forward_buf, 2);
}

// Forwarding of messages ButtonController::WS::DueOFF
void forward_ButtonController_send_WS_DueOFF(struct ButtonController_Instance *_instance){
byte forward_buf[2];
forward_buf[0] = (91 >> 8) & 0xFF;
forward_buf[1] =  91 & 0xFF;


//Forwarding with specified function 
Websocket_forwardMessage(forward_buf, 2);
}


//external Message enqueue
void externalMessageEnqueue(uint8_t * msg, uint8_t msgSize, uint16_t listener_id) {
if ((msgSize >= 2) && (msg != NULL)) {
uint8_t msgSizeOK = 0;
switch(msg[0] * 256 + msg[1]) {
case 91:
if(msgSize == 2) {
msgSizeOK = 1;}
break;
case 1:
if(msgSize == 6) {
msgSizeOK = 1;}
break;
case 81:
if(msgSize == 2) {
msgSizeOK = 1;}
break;
case 80:
if(msgSize == 2) {
msgSizeOK = 1;}
break;
case 2:
if(msgSize == 6) {
msgSizeOK = 1;}
break;
case 90:
if(msgSize == 2) {
msgSizeOK = 1;}
break;
}

if(msgSizeOK == 1) {
fifo_lock();
if ( fifo_byte_available() > (msgSize + 2) ) {
	uint8_t i;
	for (i = 0; i < 2; i++) {
		_fifo_enqueue(msg[i]);
	}
	_fifo_enqueue((listener_id >> 8) & 0xFF);
	_fifo_enqueue(listener_id & 0xFF);
	for (i = 2; i < msgSize; i++) {
		_fifo_enqueue(msg[i]);
	}
}
fifo_unlock_and_notify();
}
}
}

void initialize_configuration_dynButtonControllerCfg() {
// Initialize connectors
register_external_ButtonController_send_Bridge_GreenON_listener(forward_ButtonController_send_Bridge_GreenON);
register_external_ButtonController_send_Bridge_GreenOFF_listener(forward_ButtonController_send_Bridge_GreenOFF);
register_external_ButtonController_send_Bridge_BlueON_listener(forward_ButtonController_send_Bridge_BlueON);
register_external_ButtonController_send_Bridge_BlueOFF_listener(forward_ButtonController_send_Bridge_BlueOFF);
register_external_ButtonController_send_WS_GreenON_listener(forward_ButtonController_send_WS_GreenON);
register_external_ButtonController_send_WS_GreenOFF_listener(forward_ButtonController_send_WS_GreenOFF);
register_external_ButtonController_send_WS_BlueON_listener(forward_ButtonController_send_WS_BlueON);
register_external_ButtonController_send_WS_BlueOFF_listener(forward_ButtonController_send_WS_BlueOFF);
register_external_ButtonController_send_WS_UnoON_listener(forward_ButtonController_send_WS_UnoON);
register_external_ButtonController_send_WS_UnoOFF_listener(forward_ButtonController_send_WS_UnoOFF);
register_external_ButtonController_send_WS_DueON_listener(forward_ButtonController_send_WS_DueON);
register_external_ButtonController_send_WS_DueOFF_listener(forward_ButtonController_send_WS_DueOFF);
register_ButtonController_send_Green_Useless_listener(enqueue_ButtonController_send_Green_Useless);
register_ButtonController_send_Blue_Useless_listener(enqueue_ButtonController_send_Blue_Useless);
register_ButtonController_send_Uno_UnoON_listener(enqueue_ButtonController_send_Uno_UnoON);
register_ButtonController_send_Uno_UnoOFF_listener(enqueue_ButtonController_send_Uno_UnoOFF);
register_ButtonController_send_Uno_DueON_listener(enqueue_ButtonController_send_Uno_DueON);
register_ButtonController_send_Uno_DueOFF_listener(enqueue_ButtonController_send_Uno_DueOFF);
register_ButtonController_send_Due_UnoON_listener(enqueue_ButtonController_send_Due_UnoON);
register_ButtonController_send_Due_UnoOFF_listener(enqueue_ButtonController_send_Due_UnoOFF);
register_ButtonController_send_Due_DueON_listener(enqueue_ButtonController_send_Due_DueON);
register_ButtonController_send_Due_DueOFF_listener(enqueue_ButtonController_send_Due_DueOFF);

// Init the ID, state variables and properties for instance dynButtonControllerCfg_bc
dynButtonControllerCfg_bc_var.id_Bridge = add_instance( (void*) &dynButtonControllerCfg_bc_var);
dynButtonControllerCfg_bc_Bridge_msgs[0] = 80;
dynButtonControllerCfg_bc_Bridge_handlers_tab[0] = (void*) &ButtonController_handle_Bridge_UnoON;
dynButtonControllerCfg_bc_Bridge_msgs[1] = 81;
dynButtonControllerCfg_bc_Bridge_handlers_tab[1] = (void*) &ButtonController_handle_Bridge_UnoOFF;
dynButtonControllerCfg_bc_Bridge_msgs[2] = 90;
dynButtonControllerCfg_bc_Bridge_handlers_tab[2] = (void*) &ButtonController_handle_Bridge_DueON;
dynButtonControllerCfg_bc_Bridge_msgs[3] = 91;
dynButtonControllerCfg_bc_Bridge_handlers_tab[3] = (void*) &ButtonController_handle_Bridge_DueOFF;
dynButtonControllerCfg_bc_Bridge_handlers.nb_msg = 4;
dynButtonControllerCfg_bc_Bridge_handlers.msg = (uint16_t *) &dynButtonControllerCfg_bc_Bridge_msgs;
dynButtonControllerCfg_bc_Bridge_handlers.msg_handler = (void **) &dynButtonControllerCfg_bc_Bridge_handlers_tab;
dynButtonControllerCfg_bc_Bridge_handlers.instance = &dynButtonControllerCfg_bc_var;
dynButtonControllerCfg_bc_var.Bridge_handlers = &dynButtonControllerCfg_bc_Bridge_handlers;
dynButtonControllerCfg_bc_var.Bridge_receiver_list_head = NULL;
dynButtonControllerCfg_bc_var.Bridge_receiver_list_tail = &dynButtonControllerCfg_receivers[0];
dynButtonControllerCfg_bc_var.id_WS = add_instance( (void*) &dynButtonControllerCfg_bc_var);
dynButtonControllerCfg_bc_WS_msgs[0] = 80;
dynButtonControllerCfg_bc_WS_handlers_tab[0] = (void*) &ButtonController_handle_WS_UnoON;
dynButtonControllerCfg_bc_WS_msgs[1] = 81;
dynButtonControllerCfg_bc_WS_handlers_tab[1] = (void*) &ButtonController_handle_WS_UnoOFF;
dynButtonControllerCfg_bc_WS_msgs[2] = 90;
dynButtonControllerCfg_bc_WS_handlers_tab[2] = (void*) &ButtonController_handle_WS_DueON;
dynButtonControllerCfg_bc_WS_msgs[3] = 91;
dynButtonControllerCfg_bc_WS_handlers_tab[3] = (void*) &ButtonController_handle_WS_DueOFF;
dynButtonControllerCfg_bc_WS_msgs[4] = 1;
dynButtonControllerCfg_bc_WS_handlers_tab[4] = (void*) &ButtonController_handle_WS_connect;
dynButtonControllerCfg_bc_WS_msgs[5] = 2;
dynButtonControllerCfg_bc_WS_handlers_tab[5] = (void*) &ButtonController_handle_WS_deconnect;
dynButtonControllerCfg_bc_WS_handlers.nb_msg = 6;
dynButtonControllerCfg_bc_WS_handlers.msg = (uint16_t *) &dynButtonControllerCfg_bc_WS_msgs;
dynButtonControllerCfg_bc_WS_handlers.msg_handler = (void **) &dynButtonControllerCfg_bc_WS_handlers_tab;
dynButtonControllerCfg_bc_WS_handlers.instance = &dynButtonControllerCfg_bc_var;
dynButtonControllerCfg_bc_var.WS_handlers = &dynButtonControllerCfg_bc_WS_handlers;
dynButtonControllerCfg_bc_var.WS_receiver_list_head = NULL;
dynButtonControllerCfg_bc_var.WS_receiver_list_tail = &dynButtonControllerCfg_receivers[0];
dynButtonControllerCfg_bc_var.id_Green = add_instance( (void*) &dynButtonControllerCfg_bc_var);
dynButtonControllerCfg_bc_Green_msgs[0] = 80;
dynButtonControllerCfg_bc_Green_handlers_tab[0] = (void*) &ButtonController_handle_Green_UnoON;
dynButtonControllerCfg_bc_Green_msgs[1] = 81;
dynButtonControllerCfg_bc_Green_handlers_tab[1] = (void*) &ButtonController_handle_Green_UnoOFF;
dynButtonControllerCfg_bc_Green_msgs[2] = 90;
dynButtonControllerCfg_bc_Green_handlers_tab[2] = (void*) &ButtonController_handle_Green_DueON;
dynButtonControllerCfg_bc_Green_msgs[3] = 91;
dynButtonControllerCfg_bc_Green_handlers_tab[3] = (void*) &ButtonController_handle_Green_DueOFF;
dynButtonControllerCfg_bc_Green_handlers.nb_msg = 4;
dynButtonControllerCfg_bc_Green_handlers.msg = (uint16_t *) &dynButtonControllerCfg_bc_Green_msgs;
dynButtonControllerCfg_bc_Green_handlers.msg_handler = (void **) &dynButtonControllerCfg_bc_Green_handlers_tab;
dynButtonControllerCfg_bc_Green_handlers.instance = &dynButtonControllerCfg_bc_var;
dynButtonControllerCfg_bc_var.Green_handlers = &dynButtonControllerCfg_bc_Green_handlers;
dynButtonControllerCfg_receivers[0] = &dynButtonControllerCfg_bc_Uno_handlers;
dynButtonControllerCfg_bc_var.Green_receiver_list_head = &dynButtonControllerCfg_receivers[0];
dynButtonControllerCfg_bc_var.Green_receiver_list_tail = &dynButtonControllerCfg_receivers[0];
dynButtonControllerCfg_bc_var.id_Blue = add_instance( (void*) &dynButtonControllerCfg_bc_var);
dynButtonControllerCfg_bc_Blue_msgs[0] = 80;
dynButtonControllerCfg_bc_Blue_handlers_tab[0] = (void*) &ButtonController_handle_Blue_UnoON;
dynButtonControllerCfg_bc_Blue_msgs[1] = 81;
dynButtonControllerCfg_bc_Blue_handlers_tab[1] = (void*) &ButtonController_handle_Blue_UnoOFF;
dynButtonControllerCfg_bc_Blue_msgs[2] = 90;
dynButtonControllerCfg_bc_Blue_handlers_tab[2] = (void*) &ButtonController_handle_Blue_DueON;
dynButtonControllerCfg_bc_Blue_msgs[3] = 91;
dynButtonControllerCfg_bc_Blue_handlers_tab[3] = (void*) &ButtonController_handle_Blue_DueOFF;
dynButtonControllerCfg_bc_Blue_handlers.nb_msg = 4;
dynButtonControllerCfg_bc_Blue_handlers.msg = (uint16_t *) &dynButtonControllerCfg_bc_Blue_msgs;
dynButtonControllerCfg_bc_Blue_handlers.msg_handler = (void **) &dynButtonControllerCfg_bc_Blue_handlers_tab;
dynButtonControllerCfg_bc_Blue_handlers.instance = &dynButtonControllerCfg_bc_var;
dynButtonControllerCfg_bc_var.Blue_handlers = &dynButtonControllerCfg_bc_Blue_handlers;
dynButtonControllerCfg_receivers[1] = &dynButtonControllerCfg_bc_Due_handlers;
dynButtonControllerCfg_bc_var.Blue_receiver_list_head = &dynButtonControllerCfg_receivers[1];
dynButtonControllerCfg_bc_var.Blue_receiver_list_tail = &dynButtonControllerCfg_receivers[1];
dynButtonControllerCfg_bc_var.id_Uno = add_instance( (void*) &dynButtonControllerCfg_bc_var);
dynButtonControllerCfg_bc_Uno_msgs[0] = 100;
dynButtonControllerCfg_bc_Uno_handlers_tab[0] = NULL;
dynButtonControllerCfg_bc_Uno_handlers.nb_msg = 1;
dynButtonControllerCfg_bc_Uno_handlers.msg = (uint16_t *) &dynButtonControllerCfg_bc_Uno_msgs;
dynButtonControllerCfg_bc_Uno_handlers.msg_handler = (void **) &dynButtonControllerCfg_bc_Uno_handlers_tab;
dynButtonControllerCfg_bc_Uno_handlers.instance = &dynButtonControllerCfg_bc_var;
dynButtonControllerCfg_bc_var.Uno_handlers = &dynButtonControllerCfg_bc_Uno_handlers;
dynButtonControllerCfg_receivers[2] = &dynButtonControllerCfg_bc_Green_handlers;
dynButtonControllerCfg_bc_var.Uno_receiver_list_head = &dynButtonControllerCfg_receivers[2];
dynButtonControllerCfg_bc_var.Uno_receiver_list_tail = &dynButtonControllerCfg_receivers[2];
dynButtonControllerCfg_bc_var.id_Due = add_instance( (void*) &dynButtonControllerCfg_bc_var);
dynButtonControllerCfg_bc_Due_msgs[0] = 100;
dynButtonControllerCfg_bc_Due_handlers_tab[0] = NULL;
dynButtonControllerCfg_bc_Due_handlers.nb_msg = 1;
dynButtonControllerCfg_bc_Due_handlers.msg = (uint16_t *) &dynButtonControllerCfg_bc_Due_msgs;
dynButtonControllerCfg_bc_Due_handlers.msg_handler = (void **) &dynButtonControllerCfg_bc_Due_handlers_tab;
dynButtonControllerCfg_bc_Due_handlers.instance = &dynButtonControllerCfg_bc_var;
dynButtonControllerCfg_bc_var.Due_handlers = &dynButtonControllerCfg_bc_Due_handlers;
dynButtonControllerCfg_receivers[3] = &dynButtonControllerCfg_bc_Blue_handlers;
dynButtonControllerCfg_bc_var.Due_receiver_list_head = &dynButtonControllerCfg_receivers[3];
dynButtonControllerCfg_bc_var.Due_receiver_list_tail = &dynButtonControllerCfg_receivers[3];
dynButtonControllerCfg_bc_var.ButtonController_LEDControllerChart_State = BUTTONCONTROLLER_LEDCONTROLLERCHART_INIT_STATE;

// Init the ID, state variables and properties for external connector Serial1
Serial1_instance.listener_id = add_instance( (void*) &Serial1_instance);
dynButtonControllerCfg_receivers[4] = &dynButtonControllerCfg_bc_Bridge_handlers;
Serial1_instance.Bridge_receiver_list_head = &dynButtonControllerCfg_receivers[4];
Serial1_instance.Bridge_receiver_list_tail = &dynButtonControllerCfg_receivers[4];
// Init the ID, state variables and properties for external connector Websocket
Websocket_instance.listener_id = add_instance( (void*) &Websocket_instance);
dynButtonControllerCfg_receivers[5] = &dynButtonControllerCfg_bc_WS_handlers;
Websocket_instance.WS_receiver_list_head = &dynButtonControllerCfg_receivers[5];
Websocket_instance.WS_receiver_list_tail = &dynButtonControllerCfg_receivers[5];

// Network Initilization 
//Serial1:
Serial1_setup();
pthread_t thread_bc_Bridge_Serial1;
pthread_create( &thread_bc_Bridge_Serial1, NULL, Serial1_start_receiver_process, NULL);
//Websocket:
Websocket_setup();
pthread_t thread_bc_WS_Websocket;
pthread_create( &thread_bc_WS_Websocket, NULL, Websocket_start_receiver_process, NULL);


// End Network Initilization 

dynButtonControllerCfg_init_dyn_co();
ButtonController_LEDControllerChart_OnEntry(BUTTONCONTROLLER_LEDCONTROLLERCHART_STATE, &dynButtonControllerCfg_bc_var);
}

struct Msg_Handler * dynButtonControllerCfg_dyn_co_handlers[8];
struct Msg_Handler *** dynButtonControllerCfg_dyn_co_rlist_head[8];
struct Msg_Handler *** dynButtonControllerCfg_dyn_co_rlist_tail[8];

//Init
void dynButtonControllerCfg_init_dyn_co() {
	printf("[Bridge] %i\n", dynButtonControllerCfg_bc_var.id_Bridge);
printf("[WS] %i\n", dynButtonControllerCfg_bc_var.id_WS);
printf("[Green] %i\n", dynButtonControllerCfg_bc_var.id_Green);
printf("[Blue] %i\n", dynButtonControllerCfg_bc_var.id_Blue);
printf("[Uno] %i\n", dynButtonControllerCfg_bc_var.id_Uno);
printf("[Due] %i\n", dynButtonControllerCfg_bc_var.id_Due);
printf("[Bridge] %i\n", Serial1_instance.listener_id);
printf("[WS] %i\n", Websocket_instance.listener_id);


	
	dynButtonControllerCfg_dyn_co_handlers[dynButtonControllerCfg_bc_var.id_Bridge] = &dynButtonControllerCfg_bc_Bridge_handlers;
dynButtonControllerCfg_dyn_co_handlers[dynButtonControllerCfg_bc_var.id_WS] = &dynButtonControllerCfg_bc_WS_handlers;
dynButtonControllerCfg_dyn_co_handlers[dynButtonControllerCfg_bc_var.id_Green] = &dynButtonControllerCfg_bc_Green_handlers;
dynButtonControllerCfg_dyn_co_handlers[dynButtonControllerCfg_bc_var.id_Blue] = &dynButtonControllerCfg_bc_Blue_handlers;
dynButtonControllerCfg_dyn_co_handlers[dynButtonControllerCfg_bc_var.id_Uno] = &dynButtonControllerCfg_bc_Uno_handlers;
dynButtonControllerCfg_dyn_co_handlers[dynButtonControllerCfg_bc_var.id_Due] = &dynButtonControllerCfg_bc_Due_handlers;
dynButtonControllerCfg_dyn_co_handlers[Serial1_instance.listener_id] = NULL;
dynButtonControllerCfg_dyn_co_handlers[Websocket_instance.listener_id] = NULL;
dynButtonControllerCfg_dyn_co_rlist_head[dynButtonControllerCfg_bc_var.id_Bridge] = &dynButtonControllerCfg_bc_var.Bridge_receiver_list_head;
dynButtonControllerCfg_dyn_co_rlist_head[dynButtonControllerCfg_bc_var.id_WS] = &dynButtonControllerCfg_bc_var.WS_receiver_list_head;
dynButtonControllerCfg_dyn_co_rlist_head[dynButtonControllerCfg_bc_var.id_Green] = &dynButtonControllerCfg_bc_var.Green_receiver_list_head;
dynButtonControllerCfg_dyn_co_rlist_head[dynButtonControllerCfg_bc_var.id_Blue] = &dynButtonControllerCfg_bc_var.Blue_receiver_list_head;
dynButtonControllerCfg_dyn_co_rlist_head[dynButtonControllerCfg_bc_var.id_Uno] = &dynButtonControllerCfg_bc_var.Uno_receiver_list_head;
dynButtonControllerCfg_dyn_co_rlist_head[dynButtonControllerCfg_bc_var.id_Due] = &dynButtonControllerCfg_bc_var.Due_receiver_list_head;
dynButtonControllerCfg_dyn_co_rlist_head[Serial1_instance.listener_id] = &Serial1_instance.Bridge_receiver_list_head;
dynButtonControllerCfg_dyn_co_rlist_head[Websocket_instance.listener_id] = &Websocket_instance.WS_receiver_list_head;
dynButtonControllerCfg_dyn_co_rlist_tail[dynButtonControllerCfg_bc_var.id_Bridge] = &dynButtonControllerCfg_bc_var.Bridge_receiver_list_tail;
dynButtonControllerCfg_dyn_co_rlist_tail[dynButtonControllerCfg_bc_var.id_WS] = &dynButtonControllerCfg_bc_var.WS_receiver_list_tail;
dynButtonControllerCfg_dyn_co_rlist_tail[dynButtonControllerCfg_bc_var.id_Green] = &dynButtonControllerCfg_bc_var.Green_receiver_list_tail;
dynButtonControllerCfg_dyn_co_rlist_tail[dynButtonControllerCfg_bc_var.id_Blue] = &dynButtonControllerCfg_bc_var.Blue_receiver_list_tail;
dynButtonControllerCfg_dyn_co_rlist_tail[dynButtonControllerCfg_bc_var.id_Uno] = &dynButtonControllerCfg_bc_var.Uno_receiver_list_tail;
dynButtonControllerCfg_dyn_co_rlist_tail[dynButtonControllerCfg_bc_var.id_Due] = &dynButtonControllerCfg_bc_var.Due_receiver_list_tail;
dynButtonControllerCfg_dyn_co_rlist_tail[Serial1_instance.listener_id] = &Serial1_instance.Bridge_receiver_list_tail;
dynButtonControllerCfg_dyn_co_rlist_tail[Websocket_instance.listener_id] = &Websocket_instance.WS_receiver_list_tail;

}

void print_receivers_table() {
	printf("[reiceivers] -------- Print ---------\n");
	int g = 0;
	for(g = 0; g < NB_MAX_CONNEXION; g++) {
		printf("[reiceivers] %i:%i\n", g, dynButtonControllerCfg_receivers[g]);
	}
	printf("[reiceivers] -------- End ---------\n");
}

void print_handlers_table() {
	printf("[handlers] -------- Print ---------\n");
	int g = 0;
	for(g = 0; g < 8; g++) {
		printf("[handlers] %i:%i\n", g, dynButtonControllerCfg_dyn_co_handlers[g]);
	}
	printf("[handlers] -------- End ---------\n");
}

void print_ht_table() {
	printf("[ht] -------- Print ---------\n");
	int g = 0;
	for(g = 0; g < 8; g++) {
		if(*dynButtonControllerCfg_dyn_co_rlist_head[g] != NULL) {
			printf("[ht] %i h:%i t:%i\n", g, **dynButtonControllerCfg_dyn_co_rlist_head[g], **dynButtonControllerCfg_dyn_co_rlist_tail[g]);
		} else {
			printf("[ht] %i h:%i t:%i\n", g, 0, **dynButtonControllerCfg_dyn_co_rlist_tail[g]);
		}
	}
	printf("[ht] -------- End ---------\n");
}

void dynButtonControllerCfg_dyn_unidir_connect(uint16_t p1_id, uint16_t p2_id) {
	struct Msg_Handler * lookup;
	struct Msg_Handler ** cur;
	struct Msg_Handler * tmp;
	struct Msg_Handler * to_copy;

	bool found = false;
	if(dynButtonControllerCfg_dyn_co_handlers[p2_id] != NULL) {
		if(*dynButtonControllerCfg_dyn_co_rlist_head[p1_id] != NULL) {
			lookup = **dynButtonControllerCfg_dyn_co_rlist_head[p1_id];
			while((lookup != **dynButtonControllerCfg_dyn_co_rlist_tail[p1_id]) && (!found)) {
				if(lookup == dynButtonControllerCfg_dyn_co_handlers[p2_id]) {
					found = true;
					break;
				}
				lookup++;
			}
			
			if((lookup == dynButtonControllerCfg_dyn_co_handlers[p2_id]) && (!found)) {
				found = true;
			}
		} else {
			lookup = **dynButtonControllerCfg_dyn_co_rlist_tail[p1_id];
		}
		
		if(!found) {
			cur = *dynButtonControllerCfg_dyn_co_rlist_tail[p1_id];
			to_copy = dynButtonControllerCfg_dyn_co_handlers[p2_id];

			while((to_copy != NULL) 
				&& (cur != &dynButtonControllerCfg_receivers[NB_MAX_CONNEXION-1])) {
				tmp = *cur;
				*cur = to_copy;
				to_copy = tmp;
				cur++;
			}

			int k;
			for(k = p1_id + 1; k < 8; k++) {
				if(*dynButtonControllerCfg_dyn_co_rlist_head[k] != NULL) {
					(*dynButtonControllerCfg_dyn_co_rlist_head[k])++;
				}
				(*dynButtonControllerCfg_dyn_co_rlist_tail[k])++;
			}
			if(*dynButtonControllerCfg_dyn_co_rlist_head[p1_id] == NULL) {
				*dynButtonControllerCfg_dyn_co_rlist_head[p1_id] = *dynButtonControllerCfg_dyn_co_rlist_tail[p1_id];
			} else {
				(*dynButtonControllerCfg_dyn_co_rlist_tail[p1_id])++;
			}
		}
	}
}

void dynButtonControllerCfg_dyn_connect(uint16_t p1_id, uint16_t p2_id) {
	
	dynButtonControllerCfg_dyn_unidir_connect(p1_id, p2_id);
	dynButtonControllerCfg_dyn_unidir_connect(p2_id, p1_id);
}

void dynButtonControllerCfg_dyn_unidir_deconnect(uint16_t p1_id, uint16_t p2_id) {
	struct Msg_Handler ** cur;
	struct Msg_Handler ** tmp;

	bool found = false;
	if(dynButtonControllerCfg_dyn_co_handlers[p2_id] != NULL) {
		if(*dynButtonControllerCfg_dyn_co_rlist_head[p1_id] != NULL) {
			cur = *dynButtonControllerCfg_dyn_co_rlist_head[p1_id];
			while((*cur != **dynButtonControllerCfg_dyn_co_rlist_tail[p1_id]) && (!found)) {
				if(*cur == dynButtonControllerCfg_dyn_co_handlers[p2_id]) {
					found = true;
					break;
				}
				cur++;
			}
			if((*cur == dynButtonControllerCfg_dyn_co_handlers[p2_id]) && (!found)) {
				found = true;
			}
		
			if(found) {
				while((*cur != NULL) 
					&& (cur != &dynButtonControllerCfg_receivers[NB_MAX_CONNEXION-2])) {
					tmp = cur;
					tmp++;
					*cur = *tmp;
					cur++;
				}
				if(cur == &dynButtonControllerCfg_receivers[NB_MAX_CONNEXION-2]) {
					tmp = cur;
					tmp++;
					*cur = *tmp;
					cur++;
					*cur = NULL;
				}

				int k;
				for(k = p1_id + 1; k < 8; k++) {
					if(*dynButtonControllerCfg_dyn_co_rlist_head[k] != NULL) {
						(*dynButtonControllerCfg_dyn_co_rlist_head[k])--;
					}
					(*dynButtonControllerCfg_dyn_co_rlist_tail[k])--;
				}
				if(*dynButtonControllerCfg_dyn_co_rlist_head[p1_id] == *dynButtonControllerCfg_dyn_co_rlist_tail[p1_id]) {
					*dynButtonControllerCfg_dyn_co_rlist_head[p1_id] = NULL;
				} else {
					(*dynButtonControllerCfg_dyn_co_rlist_tail[p1_id])--;
				}
			}
		}
	}
}

void dynButtonControllerCfg_dyn_deconnect(uint16_t p1_id, uint16_t p2_id) {
	
	dynButtonControllerCfg_dyn_unidir_deconnect(p1_id, p2_id);
	dynButtonControllerCfg_dyn_unidir_deconnect(p2_id, p1_id);
}




int main(int argc, char *argv[]) {
  init_runtime();
  
  initialize_configuration_dynButtonControllerCfg();

  while (1) {
    
// Network Listener
ButtonController_handle_empty_event(&dynButtonControllerCfg_bc_var);

    processMessageQueue();
  }
}