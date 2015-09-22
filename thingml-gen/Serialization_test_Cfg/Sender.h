/*****************************************************
 *      THIS IS A GENERATED FILE. DO NOT EDIT.
 *           Header for Thing Sender
 *  Generated from ThingML (http://www.thingml.org)
 *****************************************************/

#ifndef Sender_H_
#define Sender_H_

#ifdef __cplusplus
extern "C" {
#endif

#include "thingml_typedefs.h"

/*****************************************************************************
 * Headers for type : Sender
 *****************************************************************************/

// Definition of the instance stuct:
struct Sender_Instance {
// Variables for the ID of the instance
int id;
// Variables for the current instance state
int Sender_SenderChart_State;
// Variables for the properties of the instance

};
// Declaration of prototypes outgoing messages:
void Sender_SenderChart_OnEntry(int state, struct Sender_Instance *_instance);
void Sender_handle_myPort_ready(struct Sender_Instance *_instance);
// Declaration of callbacks for incoming messages:
void register_Sender_send_myPort_mEmpty_listener(void (*_listener)(struct Sender_Instance *));
void register_Sender_send_myPort_mChar_listener(void (*_listener)(struct Sender_Instance *, char));
void register_Sender_send_myPort_mBoolean_listener(void (*_listener)(struct Sender_Instance *, uint8_t));
void register_Sender_send_myPort_mUInt8_listener(void (*_listener)(struct Sender_Instance *, uint8_t));
void register_Sender_send_myPort_mUInt16_listener(void (*_listener)(struct Sender_Instance *, uint16_t));
void register_Sender_send_myPort_mInt16_listener(void (*_listener)(struct Sender_Instance *, int16_t));
void register_Sender_send_myPort_mUInt32_listener(void (*_listener)(struct Sender_Instance *, uint32_t));
void register_Sender_send_myPort_mInteger_listener(void (*_listener)(struct Sender_Instance *, int16_t));
void register_Sender_send_myPort_mLong_listener(void (*_listener)(struct Sender_Instance *, long));
void register_Sender_send_myPort_mDouble_listener(void (*_listener)(struct Sender_Instance *, double));
void register_Sender_send_myPort_mFloat_listener(void (*_listener)(struct Sender_Instance *, float));
void register_Sender_send_myPort_mEnum_listener(void (*_listener)(struct Sender_Instance *, uint8_t));
void register_Sender_send_myPort_mDoubleFloat_listener(void (*_listener)(struct Sender_Instance *, float, float));

// Definition of the states:
#define SENDER_SENDERCHART_STATE 0
#define SENDER_SENDERCHART_INIT_STATE 1
#define SENDER_SENDERCHART_SEND_MEMTPY_STATE 2
#define SENDER_SENDERCHART_SEND_MCHAR_STATE 3
#define SENDER_SENDERCHART_SEND_MBOOLEAN_STATE 4
#define SENDER_SENDERCHART_SEND_MUINT8_STATE 5
#define SENDER_SENDERCHART_SEND_MUINT16_STATE 6
#define SENDER_SENDERCHART_SEND_MINT16_STATE 7
#define SENDER_SENDERCHART_SEND_MUINT32_STATE 8
#define SENDER_SENDERCHART_SEND_MINTEGER_STATE 9
#define SENDER_SENDERCHART_SEND_MFLOAT_STATE 10
#define SENDER_SENDERCHART_SEND_MDOUBLEFLOAT_STATE 11
#define SENDER_SENDERCHART_SEND_MDOUBLE_STATE 12
#define SENDER_SENDERCHART_SEND_MLONG_STATE 13
#define SENDER_SENDERCHART_SEND_MENUM_STATE 14



#ifdef __cplusplus
}
#endif

#endif //Sender_H_
