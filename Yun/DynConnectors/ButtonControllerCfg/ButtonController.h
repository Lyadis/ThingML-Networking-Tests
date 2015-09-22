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
uint16_t id_Bridge;
// Pointer to receiver list
struct Msg_Handler ** Bridge_receiver_list_head;
struct Msg_Handler ** Bridge_receiver_list_tail;
// Handler Array
struct Msg_Handler * Bridge_handlers;
uint16_t id_WS;
// Pointer to receiver list
struct Msg_Handler ** WS_receiver_list_head;
struct Msg_Handler ** WS_receiver_list_tail;
// Handler Array
struct Msg_Handler * WS_handlers;
uint16_t id_Green;
// Pointer to receiver list
struct Msg_Handler ** Green_receiver_list_head;
struct Msg_Handler ** Green_receiver_list_tail;
// Handler Array
struct Msg_Handler * Green_handlers;
uint16_t id_Blue;
// Pointer to receiver list
struct Msg_Handler ** Blue_receiver_list_head;
struct Msg_Handler ** Blue_receiver_list_tail;
// Handler Array
struct Msg_Handler * Blue_handlers;
uint16_t id_Uno;
// Pointer to receiver list
struct Msg_Handler ** Uno_receiver_list_head;
struct Msg_Handler ** Uno_receiver_list_tail;
// Handler Array
struct Msg_Handler * Uno_handlers;
uint16_t id_Due;
// Pointer to receiver list
struct Msg_Handler ** Due_receiver_list_head;
struct Msg_Handler ** Due_receiver_list_tail;
// Handler Array
struct Msg_Handler * Due_handlers;
// Variables for the current instance state
int ButtonController_LEDControllerChart_State;
// Variables for the properties of the instance

};
// Declaration of prototypes outgoing messages:
void ButtonController_LEDControllerChart_OnEntry(int state, struct ButtonController_Instance *_instance);
void ButtonController_handle_Green_UnoON(struct ButtonController_Instance *_instance);
void ButtonController_handle_Green_UnoOFF(struct ButtonController_Instance *_instance);
void ButtonController_handle_Green_DueOFF(struct ButtonController_Instance *_instance);
void ButtonController_handle_Green_DueON(struct ButtonController_Instance *_instance);
void ButtonController_handle_WS_UnoON(struct ButtonController_Instance *_instance);
void ButtonController_handle_WS_UnoOFF(struct ButtonController_Instance *_instance);
void ButtonController_handle_WS_DueOFF(struct ButtonController_Instance *_instance);
void ButtonController_handle_WS_DueON(struct ButtonController_Instance *_instance);
void ButtonController_handle_Bridge_UnoON(struct ButtonController_Instance *_instance);
void ButtonController_handle_Bridge_UnoOFF(struct ButtonController_Instance *_instance);
void ButtonController_handle_Bridge_DueOFF(struct ButtonController_Instance *_instance);
void ButtonController_handle_Bridge_DueON(struct ButtonController_Instance *_instance);
void ButtonController_handle_Blue_UnoON(struct ButtonController_Instance *_instance);
void ButtonController_handle_Blue_UnoOFF(struct ButtonController_Instance *_instance);
void ButtonController_handle_Blue_DueOFF(struct ButtonController_Instance *_instance);
void ButtonController_handle_Blue_DueON(struct ButtonController_Instance *_instance);
// Declaration of callbacks for incoming messages:
void register_ButtonController_send_Bridge_GreenON_listener(void (*_listener)(struct ButtonController_Instance *));
void register_external_ButtonController_send_Bridge_GreenON_listener(void (*_listener)(struct ButtonController_Instance *));
void register_ButtonController_send_Bridge_GreenOFF_listener(void (*_listener)(struct ButtonController_Instance *));
void register_external_ButtonController_send_Bridge_GreenOFF_listener(void (*_listener)(struct ButtonController_Instance *));
void register_ButtonController_send_Bridge_BlueON_listener(void (*_listener)(struct ButtonController_Instance *));
void register_external_ButtonController_send_Bridge_BlueON_listener(void (*_listener)(struct ButtonController_Instance *));
void register_ButtonController_send_Bridge_BlueOFF_listener(void (*_listener)(struct ButtonController_Instance *));
void register_external_ButtonController_send_Bridge_BlueOFF_listener(void (*_listener)(struct ButtonController_Instance *));
void register_ButtonController_send_WS_GreenON_listener(void (*_listener)(struct ButtonController_Instance *));
void register_external_ButtonController_send_WS_GreenON_listener(void (*_listener)(struct ButtonController_Instance *));
void register_ButtonController_send_WS_GreenOFF_listener(void (*_listener)(struct ButtonController_Instance *));
void register_external_ButtonController_send_WS_GreenOFF_listener(void (*_listener)(struct ButtonController_Instance *));
void register_ButtonController_send_WS_BlueON_listener(void (*_listener)(struct ButtonController_Instance *));
void register_external_ButtonController_send_WS_BlueON_listener(void (*_listener)(struct ButtonController_Instance *));
void register_ButtonController_send_WS_BlueOFF_listener(void (*_listener)(struct ButtonController_Instance *));
void register_external_ButtonController_send_WS_BlueOFF_listener(void (*_listener)(struct ButtonController_Instance *));
void register_ButtonController_send_WS_UnoON_listener(void (*_listener)(struct ButtonController_Instance *));
void register_external_ButtonController_send_WS_UnoON_listener(void (*_listener)(struct ButtonController_Instance *));
void register_ButtonController_send_WS_UnoOFF_listener(void (*_listener)(struct ButtonController_Instance *));
void register_external_ButtonController_send_WS_UnoOFF_listener(void (*_listener)(struct ButtonController_Instance *));
void register_ButtonController_send_WS_DueON_listener(void (*_listener)(struct ButtonController_Instance *));
void register_external_ButtonController_send_WS_DueON_listener(void (*_listener)(struct ButtonController_Instance *));
void register_ButtonController_send_WS_DueOFF_listener(void (*_listener)(struct ButtonController_Instance *));
void register_external_ButtonController_send_WS_DueOFF_listener(void (*_listener)(struct ButtonController_Instance *));
void register_ButtonController_send_Green_Useless_listener(void (*_listener)(struct ButtonController_Instance *));
void register_external_ButtonController_send_Green_Useless_listener(void (*_listener)(struct ButtonController_Instance *));
void register_ButtonController_send_Blue_Useless_listener(void (*_listener)(struct ButtonController_Instance *));
void register_external_ButtonController_send_Blue_Useless_listener(void (*_listener)(struct ButtonController_Instance *));
void register_ButtonController_send_Uno_UnoON_listener(void (*_listener)(struct ButtonController_Instance *));
void register_external_ButtonController_send_Uno_UnoON_listener(void (*_listener)(struct ButtonController_Instance *));
void register_ButtonController_send_Uno_UnoOFF_listener(void (*_listener)(struct ButtonController_Instance *));
void register_external_ButtonController_send_Uno_UnoOFF_listener(void (*_listener)(struct ButtonController_Instance *));
void register_ButtonController_send_Uno_DueON_listener(void (*_listener)(struct ButtonController_Instance *));
void register_external_ButtonController_send_Uno_DueON_listener(void (*_listener)(struct ButtonController_Instance *));
void register_ButtonController_send_Uno_DueOFF_listener(void (*_listener)(struct ButtonController_Instance *));
void register_external_ButtonController_send_Uno_DueOFF_listener(void (*_listener)(struct ButtonController_Instance *));
void register_ButtonController_send_Due_UnoON_listener(void (*_listener)(struct ButtonController_Instance *));
void register_external_ButtonController_send_Due_UnoON_listener(void (*_listener)(struct ButtonController_Instance *));
void register_ButtonController_send_Due_UnoOFF_listener(void (*_listener)(struct ButtonController_Instance *));
void register_external_ButtonController_send_Due_UnoOFF_listener(void (*_listener)(struct ButtonController_Instance *));
void register_ButtonController_send_Due_DueON_listener(void (*_listener)(struct ButtonController_Instance *));
void register_external_ButtonController_send_Due_DueON_listener(void (*_listener)(struct ButtonController_Instance *));
void register_ButtonController_send_Due_DueOFF_listener(void (*_listener)(struct ButtonController_Instance *));
void register_external_ButtonController_send_Due_DueOFF_listener(void (*_listener)(struct ButtonController_Instance *));

// Definition of the states:
#define BUTTONCONTROLLER_LEDCONTROLLERCHART_STATE 0
#define BUTTONCONTROLLER_LEDCONTROLLERCHART_INIT_STATE 1
#define BUTTONCONTROLLER_LEDCONTROLLERCHART_RUNNING_STATE 2



#ifdef __cplusplus
}
#endif

#endif //ButtonController_H_
