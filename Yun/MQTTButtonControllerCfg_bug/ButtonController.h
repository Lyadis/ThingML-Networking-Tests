/*****************************************************
 *      THIS IS A GENERATED FILE. DO NOT EDIT.
 *           Header for Thing ButtonController
 *  Generated from ThingML (http://www.thingml.org)
 *****************************************************/

#ifndef ButtonController_H_
#define ButtonController_H_

#ifdef __cplusplus
extern "C" {
#endif

#include "thingml_typedefs.h"

/*****************************************************************************
 * Headers for type : ButtonController
 *****************************************************************************/

// Definition of the instance stuct:
struct ButtonController_Instance {
// Variables for the ID of the ports of the instance
uint16_t id_LEDport;
// Pointer to receiver list
struct Msg_Handler ** LEDport_receiver_list_head;
struct Msg_Handler ** LEDport_receiver_list_tail;
// Handler Array
struct Msg_Handler * LEDport_handlers;
uint16_t id_WS;
// Pointer to receiver list
struct Msg_Handler ** WS_receiver_list_head;
struct Msg_Handler ** WS_receiver_list_tail;
// Handler Array
struct Msg_Handler * WS_handlers;
// Variables for the current instance state
int ButtonController_LEDControllerChart_State;
// Variables for the properties of the instance

};
// Declaration of prototypes outgoing messages:
void ButtonController_LEDControllerChart_OnEntry(int state, struct ButtonController_Instance *_instance);
void ButtonController_handle_LEDport_LEDOFF(struct ButtonController_Instance *_instance);
void ButtonController_handle_LEDport_LEDON(struct ButtonController_Instance *_instance);
void ButtonController_handle_WS_LEDOFF(struct ButtonController_Instance *_instance);
void ButtonController_handle_WS_LEDON(struct ButtonController_Instance *_instance);
// Declaration of callbacks for incoming messages:
void register_ButtonController_send_LEDport_LEDON_listener(void (*_listener)(struct ButtonController_Instance *));
void register_external_ButtonController_send_LEDport_LEDON_listener(void (*_listener)(struct ButtonController_Instance *));
void register_ButtonController_send_LEDport_LEDOFF_listener(void (*_listener)(struct ButtonController_Instance *));
void register_external_ButtonController_send_LEDport_LEDOFF_listener(void (*_listener)(struct ButtonController_Instance *));
void register_ButtonController_send_LEDport_LEDControllerReady_listener(void (*_listener)(struct ButtonController_Instance *));
void register_external_ButtonController_send_LEDport_LEDControllerReady_listener(void (*_listener)(struct ButtonController_Instance *));
void register_ButtonController_send_WS_LEDisON_listener(void (*_listener)(struct ButtonController_Instance *));
void register_external_ButtonController_send_WS_LEDisON_listener(void (*_listener)(struct ButtonController_Instance *));
void register_ButtonController_send_WS_LEDisOFF_listener(void (*_listener)(struct ButtonController_Instance *));
void register_external_ButtonController_send_WS_LEDisOFF_listener(void (*_listener)(struct ButtonController_Instance *));

// Definition of the states:
#define BUTTONCONTROLLER_LEDCONTROLLERCHART_STATE 0
#define BUTTONCONTROLLER_LEDCONTROLLERCHART_INIT_STATE 1
#define BUTTONCONTROLLER_LEDCONTROLLERCHART_RUNNING_STATE 2



#ifdef __cplusplus
}
#endif

#endif //ButtonController_H_
