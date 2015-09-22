/*****************************************************
 *      THIS IS A GENERATED FILE. DO NOT EDIT.
 *      Implementation for Application MQTTButtonControllerCfg
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
#include "bc_LEDport_Serial1.h"
#include "bc_mqttport_MQTT.h"





/*****************************************************************************
 * Definitions for configuration : MQTTButtonControllerCfg
 *****************************************************************************/

//Declaration of connexion array
#define NB_MAX_CONNEXION 2
struct Msg_Handler * MQTTButtonControllerCfg_receivers[NB_MAX_CONNEXION];

//Declaration of instance variables
//Instance MQTTButtonControllerCfg_bc
struct ButtonController_Instance MQTTButtonControllerCfg_bc_var;
struct Msg_Handler MQTTButtonControllerCfg_bc_LEDport_handlers;
uint16_t MQTTButtonControllerCfg_bc_LEDport_msgs[3];
void * MQTTButtonControllerCfg_bc_LEDport_handlers_tab[3];

struct Msg_Handler MQTTButtonControllerCfg_bc_mqttport_handlers;
uint16_t MQTTButtonControllerCfg_bc_mqttport_msgs[2];
void * MQTTButtonControllerCfg_bc_mqttport_handlers_tab[2];




//Dynamic dispatcher for message LEDOFF
void dispatch_LEDOFF(uint16_t sender) {
void executor_dispatch_LEDOFF(struct Msg_Handler ** head, struct Msg_Handler ** tail) {
struct Msg_Handler ** cur = head;
while (cur != NULL) {
   void (*handler)(void *) = NULL;
   int i;
   for(i = 0; i < (**cur).nb_msg; i++) {
       if((**cur).msg[i] == 67) {
           handler = (void (*) (void *)) (**cur).msg_handler[i];
           break;
       }
   }
   if(handler != NULL) {
       handler((**cur).instance);
printf("[Dispatcher] Calling handler for LEDOFF\n");
}
   if(cur == tail){
       cur = NULL;}
   else {
   cur++;}
}
}
if (sender == MQTTButtonControllerCfg_bc_var.id_LEDport) {
executor_dispatch_LEDOFF(MQTTButtonControllerCfg_bc_var.LEDport_receiver_list_head,MQTTButtonControllerCfg_bc_var.LEDport_receiver_list_tail);}
if (sender == MQTT_instance.listener_id) {
executor_dispatch_LEDOFF(MQTT_instance.mqttport_receiver_list_head,MQTT_instance.mqttport_receiver_list_tail);}
if (sender == Serial1_instance.listener_id) {
executor_dispatch_LEDOFF(Serial1_instance.LEDport_receiver_list_head,Serial1_instance.LEDport_receiver_list_tail);}
}

//Dynamic dispatcher for message LEDControllerReady
void dispatch_LEDControllerReady(uint16_t sender) {
void executor_dispatch_LEDControllerReady(struct Msg_Handler ** head, struct Msg_Handler ** tail) {
struct Msg_Handler ** cur = head;
while (cur != NULL) {
   void (*handler)(void *) = NULL;
   int i;
   for(i = 0; i < (**cur).nb_msg; i++) {
       if((**cur).msg[i] == 65) {
           handler = (void (*) (void *)) (**cur).msg_handler[i];
           break;
       }
   }
   if(handler != NULL) {
       handler((**cur).instance);
printf("[Dispatcher] Calling handler for LEDControllerReady\n");
}
   if(cur == tail){
       cur = NULL;}
   else {
   cur++;}
}
}
if (sender == MQTTButtonControllerCfg_bc_var.id_LEDport) {
executor_dispatch_LEDControllerReady(MQTTButtonControllerCfg_bc_var.LEDport_receiver_list_head,MQTTButtonControllerCfg_bc_var.LEDport_receiver_list_tail);}
if (sender == Serial1_instance.listener_id) {
executor_dispatch_LEDControllerReady(Serial1_instance.LEDport_receiver_list_head,Serial1_instance.LEDport_receiver_list_tail);}
}

//Dynamic dispatcher for message LEDON
void dispatch_LEDON(uint16_t sender) {
void executor_dispatch_LEDON(struct Msg_Handler ** head, struct Msg_Handler ** tail) {
struct Msg_Handler ** cur = head;
while (cur != NULL) {
   void (*handler)(void *) = NULL;
   int i;
   for(i = 0; i < (**cur).nb_msg; i++) {
       if((**cur).msg[i] == 66) {
           handler = (void (*) (void *)) (**cur).msg_handler[i];
           break;
       }
   }
   if(handler != NULL) {
       handler((**cur).instance);
printf("[Dispatcher] Calling handler for LEDON\n");
}
   if(cur == tail){
       cur = NULL;}
   else {
   cur++;}
}
}
if (sender == MQTTButtonControllerCfg_bc_var.id_LEDport) {
executor_dispatch_LEDON(MQTTButtonControllerCfg_bc_var.LEDport_receiver_list_head,MQTTButtonControllerCfg_bc_var.LEDport_receiver_list_tail);}
if (sender == MQTT_instance.listener_id) {
executor_dispatch_LEDON(MQTT_instance.mqttport_receiver_list_head,MQTT_instance.mqttport_receiver_list_tail);}
if (sender == Serial1_instance.listener_id) {
executor_dispatch_LEDON(Serial1_instance.LEDport_receiver_list_head,Serial1_instance.LEDport_receiver_list_tail);}
}

void processMessageQueue() {
fifo_lock();
while (fifo_empty()) fifo_wait();
byte mbuf[2];
uint8_t mbufi = 0;

// Read the code of the next port/message in the queue
uint16_t code = fifo_dequeue() << 8;

code += fifo_dequeue();

// Switch to call the appropriate handler
switch(code) {
case 67:
while (mbufi < 2) mbuf[mbufi++] = fifo_dequeue();
printf("[PMQ] Dequeue LEDOFF\n");
printf("[PMQ] Dequeue |");
printf("%i", mbuf[0]);
printf("|");
printf("%i", mbuf[1]);
printf("|");
printf("\n");
fifo_unlock();
dispatch_LEDOFF((mbuf[0] << 8) + mbuf[1] /* instance port*/);
break;
case 65:
while (mbufi < 2) mbuf[mbufi++] = fifo_dequeue();
printf("[PMQ] Dequeue LEDControllerReady\n");
printf("[PMQ] Dequeue |");
printf("%i", mbuf[0]);
printf("|");
printf("%i", mbuf[1]);
printf("|");
printf("\n");
fifo_unlock();
dispatch_LEDControllerReady((mbuf[0] << 8) + mbuf[1] /* instance port*/);
break;
case 66:
while (mbufi < 2) mbuf[mbufi++] = fifo_dequeue();
printf("[PMQ] Dequeue LEDON\n");
printf("[PMQ] Dequeue |");
printf("%i", mbuf[0]);
printf("|");
printf("%i", mbuf[1]);
printf("|");
printf("\n");
fifo_unlock();
dispatch_LEDON((mbuf[0] << 8) + mbuf[1] /* instance port*/);
break;
}
}

// Forwarding of messages ButtonController::LEDport::LEDON
void forward_ButtonController_send_LEDport_LEDON(struct ButtonController_Instance *_instance){
byte forward_buf[2];
forward_buf[0] = (66 >> 8) & 0xFF;
forward_buf[1] =  66 & 0xFF;


//Forwarding with specified function 
Serial1_forwardMessage(forward_buf, 2);
}

// Forwarding of messages ButtonController::LEDport::LEDOFF
void forward_ButtonController_send_LEDport_LEDOFF(struct ButtonController_Instance *_instance){
byte forward_buf[2];
forward_buf[0] = (67 >> 8) & 0xFF;
forward_buf[1] =  67 & 0xFF;


//Forwarding with specified function 
Serial1_forwardMessage(forward_buf, 2);
}

// Forwarding of messages ButtonController::LEDport::LEDControllerReady
void forward_ButtonController_send_LEDport_LEDControllerReady(struct ButtonController_Instance *_instance){
byte forward_buf[2];
forward_buf[0] = (65 >> 8) & 0xFF;
forward_buf[1] =  65 & 0xFF;


//Forwarding with specified function 
Serial1_forwardMessage(forward_buf, 2);
}

// Forwarding of messages ButtonController::mqttport::LEDisON
void forward_ButtonController_send_mqttport_LEDisON(struct ButtonController_Instance *_instance, uint16_t TopicID){
byte forward_buf[4];
forward_buf[0] = (101 >> 8) & 0xFF;
forward_buf[1] =  101 & 0xFF;


// parameter TopicID

//Forwarding with specified function 
MQTT_forwardMessage(forward_buf, 2, TopicID);
}

// Forwarding of messages ButtonController::mqttport::LEDisOFF
void forward_ButtonController_send_mqttport_LEDisOFF(struct ButtonController_Instance *_instance, uint16_t TopicID){
byte forward_buf[4];
forward_buf[0] = (102 >> 8) & 0xFF;
forward_buf[1] =  102 & 0xFF;


// parameter TopicID

//Forwarding with specified function 
MQTT_forwardMessage(forward_buf, 2, TopicID);
}


//external Message enqueue
void externalMessageEnqueue(uint8_t * msg, uint8_t msgSize, uint16_t listener_id) {
if ((msgSize >= 2) && (msg != NULL)) {
uint8_t msgSizeOK = 0;
switch(msg[0] * 256 + msg[1]) {
case 67:
if(msgSize == 2) {
msgSizeOK = 1;}
break;
case 65:
if(msgSize == 2) {
msgSizeOK = 1;}
break;
case 66:
if(msgSize == 2) {
msgSizeOK = 1;}
break;
default:{
printf("[External Enqueue] Unknown message ID:");
printf("%i", (msg[0] * 256 + msg[1]));
printf("\n");
break;}
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
else {printf("[External Enqueue] Malformed message (ID:");
printf("%i", (msg[0] * 256 + msg[1]));
printf(")\n");
}
}
else {printf("[External Enqueue] Unreadable message ID\n");
}
}

void initialize_configuration_MQTTButtonControllerCfg() {
// Initialize connectors
register_external_ButtonController_send_LEDport_LEDON_listener(forward_ButtonController_send_LEDport_LEDON);
register_external_ButtonController_send_LEDport_LEDOFF_listener(forward_ButtonController_send_LEDport_LEDOFF);
register_external_ButtonController_send_LEDport_LEDControllerReady_listener(forward_ButtonController_send_LEDport_LEDControllerReady);
register_external_ButtonController_send_mqttport_LEDisON_listener(forward_ButtonController_send_mqttport_LEDisON);
register_external_ButtonController_send_mqttport_LEDisOFF_listener(forward_ButtonController_send_mqttport_LEDisOFF);

// Init the ID, state variables and properties for instance MQTTButtonControllerCfg_bc
printf("Initialization of MQTTButtonControllerCfg_bc\n");
MQTTButtonControllerCfg_bc_var.id_LEDport = add_instance( (void*) &MQTTButtonControllerCfg_bc_var);
MQTTButtonControllerCfg_bc_LEDport_msgs[0] = 66;
MQTTButtonControllerCfg_bc_LEDport_handlers_tab[0] = (void*) &ButtonController_handle_LEDport_LEDON;
MQTTButtonControllerCfg_bc_LEDport_msgs[1] = 67;
MQTTButtonControllerCfg_bc_LEDport_handlers_tab[1] = (void*) &ButtonController_handle_LEDport_LEDOFF;
MQTTButtonControllerCfg_bc_LEDport_msgs[2] = 65;
MQTTButtonControllerCfg_bc_LEDport_handlers_tab[2] = NULL;
MQTTButtonControllerCfg_bc_LEDport_handlers.nb_msg = 3;
MQTTButtonControllerCfg_bc_LEDport_handlers.msg = (uint16_t *) &MQTTButtonControllerCfg_bc_LEDport_msgs;
MQTTButtonControllerCfg_bc_LEDport_handlers.msg_handler = (void **) &MQTTButtonControllerCfg_bc_LEDport_handlers_tab;
MQTTButtonControllerCfg_bc_LEDport_handlers.instance = &MQTTButtonControllerCfg_bc_var;
MQTTButtonControllerCfg_bc_var.LEDport_handlers = &MQTTButtonControllerCfg_bc_LEDport_handlers;
MQTTButtonControllerCfg_bc_var.LEDport_receiver_list_head = NULL;
MQTTButtonControllerCfg_bc_var.LEDport_receiver_list_tail = &MQTTButtonControllerCfg_receivers[0];
MQTTButtonControllerCfg_bc_var.id_mqttport = add_instance( (void*) &MQTTButtonControllerCfg_bc_var);
MQTTButtonControllerCfg_bc_mqttport_msgs[0] = 66;
MQTTButtonControllerCfg_bc_mqttport_handlers_tab[0] = (void*) &ButtonController_handle_mqttport_LEDON;
MQTTButtonControllerCfg_bc_mqttport_msgs[1] = 67;
MQTTButtonControllerCfg_bc_mqttport_handlers_tab[1] = (void*) &ButtonController_handle_mqttport_LEDOFF;
MQTTButtonControllerCfg_bc_mqttport_handlers.nb_msg = 2;
MQTTButtonControllerCfg_bc_mqttport_handlers.msg = (uint16_t *) &MQTTButtonControllerCfg_bc_mqttport_msgs;
MQTTButtonControllerCfg_bc_mqttport_handlers.msg_handler = (void **) &MQTTButtonControllerCfg_bc_mqttport_handlers_tab;
MQTTButtonControllerCfg_bc_mqttport_handlers.instance = &MQTTButtonControllerCfg_bc_var;
MQTTButtonControllerCfg_bc_var.mqttport_handlers = &MQTTButtonControllerCfg_bc_mqttport_handlers;
MQTTButtonControllerCfg_bc_var.mqttport_receiver_list_head = NULL;
MQTTButtonControllerCfg_bc_var.mqttport_receiver_list_tail = &MQTTButtonControllerCfg_receivers[0];
MQTTButtonControllerCfg_bc_var.ButtonController_LEDControllerChart_State = BUTTONCONTROLLER_LEDCONTROLLERCHART_INIT_STATE;

// Init the ID, state variables and properties for external connector Serial1
Serial1_instance.listener_id = add_instance( (void*) &Serial1_instance);
MQTTButtonControllerCfg_receivers[0] = &MQTTButtonControllerCfg_bc_LEDport_handlers;
Serial1_instance.LEDport_receiver_list_head = &MQTTButtonControllerCfg_receivers[0];
Serial1_instance.LEDport_receiver_list_tail = &MQTTButtonControllerCfg_receivers[0];
// Init the ID, state variables and properties for external connector MQTT
MQTT_instance.listener_id = add_instance( (void*) &MQTT_instance);
MQTTButtonControllerCfg_receivers[1] = &MQTTButtonControllerCfg_bc_mqttport_handlers;
MQTT_instance.mqttport_receiver_list_head = &MQTTButtonControllerCfg_receivers[1];
MQTT_instance.mqttport_receiver_list_tail = &MQTTButtonControllerCfg_receivers[1];

// Network Initilization 
//Serial1:
Serial1_setup();
Serial1_set_listener_id(MQTTButtonControllerCfg_bc_var.id_LEDport);
pthread_t thread_bc_LEDport_Serial1;
pthread_create( &thread_bc_LEDport_Serial1, NULL, Serial1_start_receiver_process, NULL);
//MQTT:
MQTT_setup();
MQTT_set_listener_id(MQTTButtonControllerCfg_bc_var.id_mqttport);
pthread_t thread_bc_mqttport_MQTT;
pthread_create( &thread_bc_mqttport_MQTT, NULL, MQTT_start_receiver_process, NULL);


// End Network Initilization 

ButtonController_LEDControllerChart_OnEntry(BUTTONCONTROLLER_LEDCONTROLLERCHART_STATE, &MQTTButtonControllerCfg_bc_var);
}




int main(int argc, char *argv[]) {
  init_runtime();
  
  initialize_configuration_MQTTButtonControllerCfg();

  while (1) {
    
// Network Listener
ButtonController_handle_empty_event(&MQTTButtonControllerCfg_bc_var);

    processMessageQueue();
  }
}