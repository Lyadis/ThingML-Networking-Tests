/*****************************************************
 *      THIS IS A GENERATED FILE. DO NOT EDIT.
 *      Implementation for Application HelloWorldCfg
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
#include "HelloWorldThing.h"





/*****************************************************************************
 * Definitions for configuration : HelloWorldCfg
 *****************************************************************************/

//Declaration of instance variables
struct HelloWorldThing_Instance HelloWorldCfg_HelloWorldInstance_var;



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
}
}

void initialize_configuration_HelloWorldCfg() {
// Initialize connectors

// Init the ID, state variables and properties for instance HelloWorldCfg_HelloWorldInstance
HelloWorldCfg_HelloWorldInstance_var.id = add_instance( (void*) &HelloWorldCfg_HelloWorldInstance_var);
HelloWorldCfg_HelloWorldInstance_var.HelloWorldThing_HelloWorldChart_State = HELLOWORLDTHING_HELLOWORLDCHART_INIT_STATE;

HelloWorldThing_HelloWorldChart_OnEntry(HELLOWORLDTHING_HELLOWORLDCHART_STATE, &HelloWorldCfg_HelloWorldInstance_var);
}




int main(int argc, char *argv[]) {
  init_runtime();
  
  initialize_configuration_HelloWorldCfg();

  while (1) {
    
    processMessageQueue();
  }
}