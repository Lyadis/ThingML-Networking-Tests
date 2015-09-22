/*****************************************************
 *      THIS IS A GENERATED FILE. DO NOT EDIT.
 *           Header for Thing Receiver
 *  Generated from ThingML (http://www.thingml.org)
 *****************************************************/

#ifndef Receiver_H_
#define Receiver_H_

#ifdef __cplusplus
extern "C" {
#endif

#include "thingml_typedefs.h"

/*****************************************************************************
 * Headers for type : Receiver
 *****************************************************************************/

// Definition of the instance stuct:
struct Receiver_Instance {
// Variables for the ID of the ports of the instance
uint16_t id_myPort;
// Pointer to receiver list
struct Msg_Handler ** myPort_receiver_list_head;
struct Msg_Handler ** myPort_receiver_list_tail;
// Handler Array
struct Msg_Handler * myPort_handlers;
// Variables for the current instance state
int Receiver_SenderChart_State;
// Variables for the properties of the instance

};
// Declaration of prototypes outgoing messages:
void Receiver_SenderChart_OnEntry(int state, struct Receiver_Instance *_instance);
void Receiver_handle_myPort_mDouble(struct Receiver_Instance *_instance, double p);
void Receiver_handle_myPort_mBoolean(struct Receiver_Instance *_instance, uint8_t p);
void Receiver_handle_myPort_mUInt16(struct Receiver_Instance *_instance, uint16_t p);
void Receiver_handle_myPort_mLong(struct Receiver_Instance *_instance, long p);
void Receiver_handle_myPort_mEnum(struct Receiver_Instance *_instance, uint8_t p);
void Receiver_handle_myPort_mInteger(struct Receiver_Instance *_instance, int16_t p);
void Receiver_handle_myPort_mEmpty(struct Receiver_Instance *_instance);
void Receiver_handle_myPort_mUInt8(struct Receiver_Instance *_instance, uint8_t p);
void Receiver_handle_myPort_mChar(struct Receiver_Instance *_instance, char p);
void Receiver_handle_myPort_mInt16(struct Receiver_Instance *_instance, int16_t p);
void Receiver_handle_myPort_mFloat(struct Receiver_Instance *_instance, float p);
void Receiver_handle_myPort_mUInt32(struct Receiver_Instance *_instance, uint32_t p);
void Receiver_handle_myPort_mDoubleFloat(struct Receiver_Instance *_instance, float p1, float p2);
// Declaration of callbacks for incoming messages:
void register_Receiver_send_myPort_ready_listener(void (*_listener)(struct Receiver_Instance *));
void register_external_Receiver_send_myPort_ready_listener(void (*_listener)(struct Receiver_Instance *));

// Definition of the states:
#define RECEIVER_SENDERCHART_STATE 0
#define RECEIVER_SENDERCHART_INIT_STATE 1



#ifdef __cplusplus
}
#endif

#endif //Receiver_H_
