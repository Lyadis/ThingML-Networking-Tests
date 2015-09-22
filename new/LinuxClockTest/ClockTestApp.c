/*****************************************************
 *      THIS IS A GENERATED FILE. DO NOT EDIT.
 *        Implementation for Thing ClockTestApp
 *  Generated from ThingML (http://www.thingml.org)
 *****************************************************/

#include "ClockTestApp.h"

/*****************************************************************************
 * Implementation for type : ClockTestApp
 *****************************************************************************/

// Declaration of prototypes:
void ClockTestApp_LinuxClockTestAppImpl_OnExit(int state, struct ClockTestApp_Instance *_instance);
// Declaration of functions:

// On Entry Actions:
void ClockTestApp_LinuxClockTestAppImpl_OnEntry(int state, struct ClockTestApp_Instance *_instance) {
switch(state) {
case CLOCKTESTAPP_LINUXCLOCKTESTAPPIMPL_STATE:
_instance->ClockTestApp_LinuxClockTestAppImpl_State = CLOCKTESTAPP_LINUXCLOCKTESTAPPIMPL_RUNNING_STATE;
ClockTestApp_LinuxClockTestAppImpl_OnEntry(_instance->ClockTestApp_LinuxClockTestAppImpl_State, _instance);
break;
case CLOCKTESTAPP_LINUXCLOCKTESTAPPIMPL_RUNNING_STATE:
break;
default: break;
}
}

// On Exit Actions:
void ClockTestApp_LinuxClockTestAppImpl_OnExit(int state, struct ClockTestApp_Instance *_instance) {
switch(state) {
case CLOCKTESTAPP_LINUXCLOCKTESTAPPIMPL_STATE:
ClockTestApp_LinuxClockTestAppImpl_OnExit(_instance->ClockTestApp_LinuxClockTestAppImpl_State, _instance);
break;
case CLOCKTESTAPP_LINUXCLOCKTESTAPPIMPL_RUNNING_STATE:
break;
default: break;
}
}

// Event Handlers for incoming messages:
void ClockTestApp_handle_clock1_clock_tick(struct ClockTestApp_Instance *_instance) {
uint8_t ClockTestApp_LinuxClockTestAppImpl_State_event_consumed = 0;
if (_instance->ClockTestApp_LinuxClockTestAppImpl_State == CLOCKTESTAPP_LINUXCLOCKTESTAPPIMPL_RUNNING_STATE) {
if (ClockTestApp_LinuxClockTestAppImpl_State_event_consumed == 0 && 1) {
fprintf(stdout, "Tick 1\n");
ClockTestApp_LinuxClockTestAppImpl_State_event_consumed = 1;
}
}
}
void ClockTestApp_handle_clock2_clock_tick(struct ClockTestApp_Instance *_instance) {
uint8_t ClockTestApp_LinuxClockTestAppImpl_State_event_consumed = 0;
if (_instance->ClockTestApp_LinuxClockTestAppImpl_State == CLOCKTESTAPP_LINUXCLOCKTESTAPPIMPL_RUNNING_STATE) {
if (ClockTestApp_LinuxClockTestAppImpl_State_event_consumed == 0 && 1) {
fprintf(stdout, "Tick 2\n");
ClockTestApp_LinuxClockTestAppImpl_State_event_consumed = 1;
}
}
}

// Observers for outgoing messages:



