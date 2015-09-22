/*****************************************************************************
 * Headers for type : Receiver
 *****************************************************************************/

// Definition of the instance stuct:
struct Receiver_Instance {
// Variables for the ID of the instance
int id;
// Variables for the current instance state
int Receiver_SenderChart_State;
// Variables for the properties of the instance

};
// Declaration of prototypes outgoing messages:
void Receiver_SenderChart_OnEntry(int state, struct Receiver_Instance *_instance);
void Receiver_handle_myPort_mEnum(struct Receiver_Instance *_instance, uint8_t p);
void Receiver_handle_myPort_mEmpty(struct Receiver_Instance *_instance);
void Receiver_handle_myPort_mInteger(struct Receiver_Instance *_instance, int16_t p);
void Receiver_handle_myPort_mUInt32(struct Receiver_Instance *_instance, uint32_t p);
void Receiver_handle_myPort_mDoubleFloat(struct Receiver_Instance *_instance, float p1, float p2);
void Receiver_handle_myPort_mLong(struct Receiver_Instance *_instance, long p);
void Receiver_handle_myPort_mDouble(struct Receiver_Instance *_instance, double p);
void Receiver_handle_myPort_mInt16(struct Receiver_Instance *_instance, int16_t p);
void Receiver_handle_myPort_mChar(struct Receiver_Instance *_instance, char p);
void Receiver_handle_myPort_mUInt16(struct Receiver_Instance *_instance, uint16_t p);
void Receiver_handle_myPort_mFloat(struct Receiver_Instance *_instance, float p);
void Receiver_handle_myPort_mBoolean(struct Receiver_Instance *_instance, uint8_t p);
void Receiver_handle_myPort_mUInt8(struct Receiver_Instance *_instance, uint8_t p);
// Declaration of callbacks for incoming messages:
void register_Receiver_send_myPort_ready_listener(void (*_listener)(struct Receiver_Instance *));

// Definition of the states:
#define RECEIVER_SENDERCHART_STATE 0
#define RECEIVER_SENDERCHART_INIT_STATE 1


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


// Definition of Enumeration  DigitalState
#define DIGITALSTATE_LOW 0
#define DIGITALSTATE_HIGH 1


/* Adds and instance to the runtime and returns its id */
uint16_t add_instance(void * instance_struct);
/* Returns the instance with id */
void * instance_by_id(uint16_t id);

/* Returns the number of byte currently in the fifo */
int fifo_byte_length();
/* Returns the number of bytes currently available in the fifo */
int fifo_byte_available();
/* Returns true if the fifo is empty */
int fifo_empty();
/* Return true if the fifo is full */
int fifo_full();
/* Enqueue 1 byte in the fifo if there is space
   returns 1 for sucess and 0 if the fifo was full */
int fifo_enqueue(byte b);
/* Enqueue 1 byte in the fifo without checking for available space
   The caller should have checked that there is enough space */
int _fifo_enqueue(byte b);
/* Dequeue 1 byte in the fifo.
   The caller should check that the fifo is not empty */
byte fifo_dequeue();

#define MAX_INSTANCES 2
#define FIFO_SIZE 256

/*********************************
 * Instance IDs and lookup
 *********************************/

void * instances[MAX_INSTANCES];
uint16_t instances_count = 0;

void * instance_by_id(uint16_t id) {
  return instances[id];
}

uint16_t add_instance(void * instance_struct) {
  instances[instances_count] = instance_struct;
  return instances_count++;
}

/******************************************
 * Simple byte FIFO implementation
 ******************************************/

byte fifo[FIFO_SIZE];
int fifo_head = 0;
int fifo_tail = 0;

// Returns the number of byte currently in the fifo
int fifo_byte_length() {
  if (fifo_tail >= fifo_head)
    return fifo_tail - fifo_head;
  return fifo_tail + FIFO_SIZE - fifo_head;
}

// Returns the number of bytes currently available in the fifo
int fifo_byte_available() {
  return FIFO_SIZE - 1 - fifo_byte_length();
}

// Returns true if the fifo is empty
int fifo_empty() {
  return fifo_head == fifo_tail;
}

// Return true if the fifo is full
int fifo_full() {
  return fifo_head == ((fifo_tail + 1) % FIFO_SIZE);
}

// Enqueue 1 byte in the fifo if there is space
// returns 1 for sucess and 0 if the fifo was full
int fifo_enqueue(byte b) {
  int new_tail = (fifo_tail + 1) % FIFO_SIZE;
  if (new_tail == fifo_head) return 0; // the fifo is full
  fifo[fifo_tail] = b;
  fifo_tail = new_tail;
  return 1;
}

// Enqueue 1 byte in the fifo without checking for available space
// The caller should have checked that there is enough space
int _fifo_enqueue(byte b) {
  fifo[fifo_tail] = b;
  fifo_tail = (fifo_tail + 1) % FIFO_SIZE;
}

// Dequeue 1 byte in the fifo.
// The caller should check that the fifo is not empty
byte fifo_dequeue() {
  if (!fifo_empty()) {
    byte result = fifo[fifo_head];
    fifo_head = (fifo_head + 1) % FIFO_SIZE;
    return result;
  }
  return 0;
}

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
Serial.print("[Sender] Ready\n");
break;
case SENDER_SENDERCHART_SEND_MEMTPY_STATE:
Sender_send_myPort_mEmpty(_instance);
Serial.print("[Sender] sent mEmpty()\n");
break;
case SENDER_SENDERCHART_SEND_MCHAR_STATE:
Sender_send_myPort_mChar(_instance, 'c');
Serial.print("[Sender] sent mChar(\'c\')\n");
break;
case SENDER_SENDERCHART_SEND_MBOOLEAN_STATE:
Sender_send_myPort_mBoolean(_instance, 1);
Serial.print("[Sender] sent mBoolean(true)\n");
break;
case SENDER_SENDERCHART_SEND_MUINT8_STATE:
Sender_send_myPort_mUInt8(_instance, 255);
Serial.print("[Sender] sent mUInt8(255)\n");
break;
case SENDER_SENDERCHART_SEND_MUINT16_STATE:
Sender_send_myPort_mUInt16(_instance, 0xFFFF);
Serial.print("[Sender] sent mUInt16(0xFFFF)\n");
break;
case SENDER_SENDERCHART_SEND_MINT16_STATE:
Sender_send_myPort_mInt16(_instance, 0xFFFF);
Serial.print("[Sender] sent mInt16(\'0xFFFF\')\n");
break;
case SENDER_SENDERCHART_SEND_MUINT32_STATE:
Sender_send_myPort_mUInt32(_instance, 0xFFFFFFFF);
Serial.print("[Sender] sent mUInt32(\'0xFFFFFFFF\')\n");
break;
case SENDER_SENDERCHART_SEND_MINTEGER_STATE:
Sender_send_myPort_mInteger(_instance, 0xFFFF);
Serial.print("[Sender] sent mInteger(\'0xFFFF\')\n");
break;
case SENDER_SENDERCHART_SEND_MFLOAT_STATE:
Sender_send_myPort_mFloat(_instance, 3.14);
Serial.print("[Sender] sent mFloat(3.14)\n");
break;
case SENDER_SENDERCHART_SEND_MDOUBLEFLOAT_STATE:
Sender_send_myPort_mDoubleFloat(_instance, 3.14, 3.14);
Serial.print("[Sender] sent mDoubleFloat(3.14, 3.14)\n");
break;
case SENDER_SENDERCHART_SEND_MDOUBLE_STATE:
Sender_send_myPort_mDouble(_instance, 3.14);
Serial.print("[Sender] sent mDouble(3.14)\n");
break;
case SENDER_SENDERCHART_SEND_MLONG_STATE:
Sender_send_myPort_mLong(_instance,  -1);
Serial.print("[Sender] sent mLong(-1)\n");
break;
case SENDER_SENDERCHART_SEND_MENUM_STATE:
Sender_send_myPort_mEnum(_instance, DIGITALSTATE_HIGH);
Serial.print("[Sender] sent mEnum(DigitalState:HIGH)\n");
Serial.print("[Sender] Done.\n");
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
uint8_t Sender_SenderChart_State_event_consumed = 0;
if (_instance->Sender_SenderChart_State == SENDER_SENDERCHART_INIT_STATE) {
if (Sender_SenderChart_State_event_consumed == 0 && 1) {
Sender_SenderChart_OnExit(SENDER_SENDERCHART_INIT_STATE, _instance);
_instance->Sender_SenderChart_State = SENDER_SENDERCHART_SEND_MEMTPY_STATE;
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
void (*Sender_send_myPort_mEmpty_listener)(struct Sender_Instance *)= 0x0;
void register_Sender_send_myPort_mEmpty_listener(void (*_listener)(struct Sender_Instance *)){
Sender_send_myPort_mEmpty_listener = _listener;
}
void Sender_send_myPort_mEmpty(struct Sender_Instance *_instance){
if (Sender_send_myPort_mEmpty_listener != 0x0) Sender_send_myPort_mEmpty_listener(_instance);
}
void (*Sender_send_myPort_mChar_listener)(struct Sender_Instance *, char)= 0x0;
void register_Sender_send_myPort_mChar_listener(void (*_listener)(struct Sender_Instance *, char)){
Sender_send_myPort_mChar_listener = _listener;
}
void Sender_send_myPort_mChar(struct Sender_Instance *_instance, char p){
if (Sender_send_myPort_mChar_listener != 0x0) Sender_send_myPort_mChar_listener(_instance, p);
}
void (*Sender_send_myPort_mBoolean_listener)(struct Sender_Instance *, uint8_t)= 0x0;
void register_Sender_send_myPort_mBoolean_listener(void (*_listener)(struct Sender_Instance *, uint8_t)){
Sender_send_myPort_mBoolean_listener = _listener;
}
void Sender_send_myPort_mBoolean(struct Sender_Instance *_instance, uint8_t p){
if (Sender_send_myPort_mBoolean_listener != 0x0) Sender_send_myPort_mBoolean_listener(_instance, p);
}
void (*Sender_send_myPort_mUInt8_listener)(struct Sender_Instance *, uint8_t)= 0x0;
void register_Sender_send_myPort_mUInt8_listener(void (*_listener)(struct Sender_Instance *, uint8_t)){
Sender_send_myPort_mUInt8_listener = _listener;
}
void Sender_send_myPort_mUInt8(struct Sender_Instance *_instance, uint8_t p){
if (Sender_send_myPort_mUInt8_listener != 0x0) Sender_send_myPort_mUInt8_listener(_instance, p);
}
void (*Sender_send_myPort_mUInt16_listener)(struct Sender_Instance *, uint16_t)= 0x0;
void register_Sender_send_myPort_mUInt16_listener(void (*_listener)(struct Sender_Instance *, uint16_t)){
Sender_send_myPort_mUInt16_listener = _listener;
}
void Sender_send_myPort_mUInt16(struct Sender_Instance *_instance, uint16_t p){
if (Sender_send_myPort_mUInt16_listener != 0x0) Sender_send_myPort_mUInt16_listener(_instance, p);
}
void (*Sender_send_myPort_mInt16_listener)(struct Sender_Instance *, int16_t)= 0x0;
void register_Sender_send_myPort_mInt16_listener(void (*_listener)(struct Sender_Instance *, int16_t)){
Sender_send_myPort_mInt16_listener = _listener;
}
void Sender_send_myPort_mInt16(struct Sender_Instance *_instance, int16_t p){
if (Sender_send_myPort_mInt16_listener != 0x0) Sender_send_myPort_mInt16_listener(_instance, p);
}
void (*Sender_send_myPort_mUInt32_listener)(struct Sender_Instance *, uint32_t)= 0x0;
void register_Sender_send_myPort_mUInt32_listener(void (*_listener)(struct Sender_Instance *, uint32_t)){
Sender_send_myPort_mUInt32_listener = _listener;
}
void Sender_send_myPort_mUInt32(struct Sender_Instance *_instance, uint32_t p){
if (Sender_send_myPort_mUInt32_listener != 0x0) Sender_send_myPort_mUInt32_listener(_instance, p);
}
void (*Sender_send_myPort_mInteger_listener)(struct Sender_Instance *, int16_t)= 0x0;
void register_Sender_send_myPort_mInteger_listener(void (*_listener)(struct Sender_Instance *, int16_t)){
Sender_send_myPort_mInteger_listener = _listener;
}
void Sender_send_myPort_mInteger(struct Sender_Instance *_instance, int16_t p){
if (Sender_send_myPort_mInteger_listener != 0x0) Sender_send_myPort_mInteger_listener(_instance, p);
}
void (*Sender_send_myPort_mLong_listener)(struct Sender_Instance *, long)= 0x0;
void register_Sender_send_myPort_mLong_listener(void (*_listener)(struct Sender_Instance *, long)){
Sender_send_myPort_mLong_listener = _listener;
}
void Sender_send_myPort_mLong(struct Sender_Instance *_instance, long p){
if (Sender_send_myPort_mLong_listener != 0x0) Sender_send_myPort_mLong_listener(_instance, p);
}
void (*Sender_send_myPort_mDouble_listener)(struct Sender_Instance *, double)= 0x0;
void register_Sender_send_myPort_mDouble_listener(void (*_listener)(struct Sender_Instance *, double)){
Sender_send_myPort_mDouble_listener = _listener;
}
void Sender_send_myPort_mDouble(struct Sender_Instance *_instance, double p){
if (Sender_send_myPort_mDouble_listener != 0x0) Sender_send_myPort_mDouble_listener(_instance, p);
}
void (*Sender_send_myPort_mFloat_listener)(struct Sender_Instance *, float)= 0x0;
void register_Sender_send_myPort_mFloat_listener(void (*_listener)(struct Sender_Instance *, float)){
Sender_send_myPort_mFloat_listener = _listener;
}
void Sender_send_myPort_mFloat(struct Sender_Instance *_instance, float p){
if (Sender_send_myPort_mFloat_listener != 0x0) Sender_send_myPort_mFloat_listener(_instance, p);
}
void (*Sender_send_myPort_mEnum_listener)(struct Sender_Instance *, uint8_t)= 0x0;
void register_Sender_send_myPort_mEnum_listener(void (*_listener)(struct Sender_Instance *, uint8_t)){
Sender_send_myPort_mEnum_listener = _listener;
}
void Sender_send_myPort_mEnum(struct Sender_Instance *_instance, uint8_t p){
if (Sender_send_myPort_mEnum_listener != 0x0) Sender_send_myPort_mEnum_listener(_instance, p);
}
void (*Sender_send_myPort_mDoubleFloat_listener)(struct Sender_Instance *, float, float)= 0x0;
void register_Sender_send_myPort_mDoubleFloat_listener(void (*_listener)(struct Sender_Instance *, float, float)){
Sender_send_myPort_mDoubleFloat_listener = _listener;
}
void Sender_send_myPort_mDoubleFloat(struct Sender_Instance *_instance, float p1, float p2){
if (Sender_send_myPort_mDoubleFloat_listener != 0x0) Sender_send_myPort_mDoubleFloat_listener(_instance, p1, p2);
}



/*****************************************************************************
 * Implementation for type : Receiver
 *****************************************************************************/

// Declaration of prototypes:
void Receiver_SenderChart_OnExit(int state, struct Receiver_Instance *_instance);
void Receiver_send_myPort_ready(struct Receiver_Instance *_instance);
// Declaration of functions:

// On Entry Actions:
void Receiver_SenderChart_OnEntry(int state, struct Receiver_Instance *_instance) {
switch(state) {
case RECEIVER_SENDERCHART_STATE:
_instance->Receiver_SenderChart_State = RECEIVER_SENDERCHART_INIT_STATE;
Receiver_SenderChart_OnEntry(_instance->Receiver_SenderChart_State, _instance);
break;
case RECEIVER_SENDERCHART_INIT_STATE:
Serial.print("[Receiver] Ready\n");
Receiver_send_myPort_ready(_instance);
break;
default: break;
}
}

// On Exit Actions:
void Receiver_SenderChart_OnExit(int state, struct Receiver_Instance *_instance) {
switch(state) {
case RECEIVER_SENDERCHART_STATE:
Receiver_SenderChart_OnExit(_instance->Receiver_SenderChart_State, _instance);
break;
case RECEIVER_SENDERCHART_INIT_STATE:
break;
default: break;
}
}

// Event Handlers for incoming messages:
void Receiver_handle_myPort_mEnum(struct Receiver_Instance *_instance, uint8_t p) {
uint8_t Receiver_SenderChart_State_event_consumed = 0;
if (_instance->Receiver_SenderChart_State == RECEIVER_SENDERCHART_INIT_STATE) {
if (Receiver_SenderChart_State_event_consumed == 0 && 1) {
Serial.print("[Receiver] received mEnum ");
Serial.print("\n");
Receiver_SenderChart_State_event_consumed = 1;
}
}
}
void Receiver_handle_myPort_mEmpty(struct Receiver_Instance *_instance) {
uint8_t Receiver_SenderChart_State_event_consumed = 0;
if (_instance->Receiver_SenderChart_State == RECEIVER_SENDERCHART_INIT_STATE) {
if (Receiver_SenderChart_State_event_consumed == 0 && 1) {
Serial.print("[Receiver] received mEmpty ");
Serial.print("\n");
Receiver_SenderChart_State_event_consumed = 1;
}
}
}
void Receiver_handle_myPort_mInteger(struct Receiver_Instance *_instance, int16_t p) {
uint8_t Receiver_SenderChart_State_event_consumed = 0;
if (_instance->Receiver_SenderChart_State == RECEIVER_SENDERCHART_INIT_STATE) {
if (Receiver_SenderChart_State_event_consumed == 0 && 1) {
Serial.print("[Receiver] received mInteger ");
Serial.print(p);
Serial.print("\n");
Receiver_SenderChart_State_event_consumed = 1;
}
}
}
void Receiver_handle_myPort_mUInt32(struct Receiver_Instance *_instance, uint32_t p) {
uint8_t Receiver_SenderChart_State_event_consumed = 0;
if (_instance->Receiver_SenderChart_State == RECEIVER_SENDERCHART_INIT_STATE) {
if (Receiver_SenderChart_State_event_consumed == 0 && 1) {
Serial.print("[Receiver] received mUInt32 ");
Serial.print(p);
Serial.print("\n");
Receiver_SenderChart_State_event_consumed = 1;
}
}
}
void Receiver_handle_myPort_mDoubleFloat(struct Receiver_Instance *_instance, float p1, float p2) {
uint8_t Receiver_SenderChart_State_event_consumed = 0;
if (_instance->Receiver_SenderChart_State == RECEIVER_SENDERCHART_INIT_STATE) {
if (Receiver_SenderChart_State_event_consumed == 0 && 1) {
Serial.print("[Receiver] received mFloat ");
Serial.print(p1);
Serial.print(" ");
Serial.print(p2);
Serial.print("\n");
Receiver_SenderChart_State_event_consumed = 1;
}
}
}
void Receiver_handle_myPort_mLong(struct Receiver_Instance *_instance, long p) {
uint8_t Receiver_SenderChart_State_event_consumed = 0;
if (_instance->Receiver_SenderChart_State == RECEIVER_SENDERCHART_INIT_STATE) {
if (Receiver_SenderChart_State_event_consumed == 0 && 1) {
Serial.print("[Receiver] received mLong ");
Serial.print(p);
Serial.print("\n");
Receiver_SenderChart_State_event_consumed = 1;
}
}
}
void Receiver_handle_myPort_mDouble(struct Receiver_Instance *_instance, double p) {
uint8_t Receiver_SenderChart_State_event_consumed = 0;
if (_instance->Receiver_SenderChart_State == RECEIVER_SENDERCHART_INIT_STATE) {
if (Receiver_SenderChart_State_event_consumed == 0 && 1) {
Serial.print("[Receiver] received mDouble ");
Serial.print(p);
Serial.print("\n");
Receiver_SenderChart_State_event_consumed = 1;
}
}
}
void Receiver_handle_myPort_mInt16(struct Receiver_Instance *_instance, int16_t p) {
uint8_t Receiver_SenderChart_State_event_consumed = 0;
if (_instance->Receiver_SenderChart_State == RECEIVER_SENDERCHART_INIT_STATE) {
if (Receiver_SenderChart_State_event_consumed == 0 && 1) {
Serial.print("[Receiver] received mInt16 ");
Serial.print(p);
Serial.print("\n");
Receiver_SenderChart_State_event_consumed = 1;
}
}
}
void Receiver_handle_myPort_mChar(struct Receiver_Instance *_instance, char p) {
uint8_t Receiver_SenderChart_State_event_consumed = 0;
if (_instance->Receiver_SenderChart_State == RECEIVER_SENDERCHART_INIT_STATE) {
if (Receiver_SenderChart_State_event_consumed == 0 && 1) {
Serial.print("[Receiver] received mChar ");
Serial.print(p);
Serial.print("\n");
Receiver_SenderChart_State_event_consumed = 1;
}
}
}
void Receiver_handle_myPort_mUInt16(struct Receiver_Instance *_instance, uint16_t p) {
uint8_t Receiver_SenderChart_State_event_consumed = 0;
if (_instance->Receiver_SenderChart_State == RECEIVER_SENDERCHART_INIT_STATE) {
if (Receiver_SenderChart_State_event_consumed == 0 && 1) {
Serial.print("[Receiver] received mUInt16 ");
Serial.print(p);
Serial.print("\n");
Receiver_SenderChart_State_event_consumed = 1;
}
}
}
void Receiver_handle_myPort_mFloat(struct Receiver_Instance *_instance, float p) {
uint8_t Receiver_SenderChart_State_event_consumed = 0;
if (_instance->Receiver_SenderChart_State == RECEIVER_SENDERCHART_INIT_STATE) {
if (Receiver_SenderChart_State_event_consumed == 0 && 1) {
Serial.print("[Receiver] received mFloat ");
Serial.print(p);
Serial.print("\n");
Receiver_SenderChart_State_event_consumed = 1;
}
}
}
void Receiver_handle_myPort_mBoolean(struct Receiver_Instance *_instance, uint8_t p) {
uint8_t Receiver_SenderChart_State_event_consumed = 0;
if (_instance->Receiver_SenderChart_State == RECEIVER_SENDERCHART_INIT_STATE) {
if (Receiver_SenderChart_State_event_consumed == 0 && 1) {
Serial.print("[Receiver] received mBoolean ");
Serial.print(p);
Serial.print("\n");
Receiver_SenderChart_State_event_consumed = 1;
}
}
}
void Receiver_handle_myPort_mUInt8(struct Receiver_Instance *_instance, uint8_t p) {
uint8_t Receiver_SenderChart_State_event_consumed = 0;
if (_instance->Receiver_SenderChart_State == RECEIVER_SENDERCHART_INIT_STATE) {
if (Receiver_SenderChart_State_event_consumed == 0 && 1) {
Serial.print("[Receiver] received mUInt8 ");
Serial.print(p);
Serial.print("\n");
Receiver_SenderChart_State_event_consumed = 1;
}
}
}

// Observers for outgoing messages:
void (*Receiver_send_myPort_ready_listener)(struct Receiver_Instance *)= 0x0;
void register_Receiver_send_myPort_ready_listener(void (*_listener)(struct Receiver_Instance *)){
Receiver_send_myPort_ready_listener = _listener;
}
void Receiver_send_myPort_ready(struct Receiver_Instance *_instance){
if (Receiver_send_myPort_ready_listener != 0x0) Receiver_send_myPort_ready_listener(_instance);
}






/*****************************************************************************
 * Definitions for configuration : Serialization_test_Cfg
 *****************************************************************************/

//Declaration of instance variables
struct Receiver_Instance Serialization_test_Cfg_r_var;
struct Sender_Instance Serialization_test_Cfg_s_var;

// Enqueue of messages Sender::myPort::mEnum
void enqueue_Sender_send_myPort_mEnum(struct Sender_Instance *_instance, uint8_t p){
//[]
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
}
// Enqueue of messages Sender::myPort::mEmpty
void enqueue_Sender_send_myPort_mEmpty(struct Sender_Instance *_instance){
//[]
if ( fifo_byte_available() > 4 ) {

_fifo_enqueue( (2 >> 8) & 0xFF );
_fifo_enqueue( 2 & 0xFF );

// ID of the source instance
_fifo_enqueue( (_instance->id >> 8) & 0xFF );
_fifo_enqueue( _instance->id & 0xFF );
}
}
// Enqueue of messages Sender::myPort::mInteger
void enqueue_Sender_send_myPort_mInteger(struct Sender_Instance *_instance, int16_t p){
//[]
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
}
// Enqueue of messages Sender::myPort::mUInt32
void enqueue_Sender_send_myPort_mUInt32(struct Sender_Instance *_instance, uint32_t p){
//[]
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
}
// Enqueue of messages Sender::myPort::mDoubleFloat
void enqueue_Sender_send_myPort_mDoubleFloat(struct Sender_Instance *_instance, float p1, float p2){
//[]
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
}
// Enqueue of messages Sender::myPort::mLong
void enqueue_Sender_send_myPort_mLong(struct Sender_Instance *_instance, long p){
//[]
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
}
// Enqueue of messages Sender::myPort::mDouble
void enqueue_Sender_send_myPort_mDouble(struct Sender_Instance *_instance, double p){
//[]
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
}
// Enqueue of messages Sender::myPort::mInt16
void enqueue_Sender_send_myPort_mInt16(struct Sender_Instance *_instance, int16_t p){
//[]
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
}
// Enqueue of messages Sender::myPort::mChar
void enqueue_Sender_send_myPort_mChar(struct Sender_Instance *_instance, char p){
//[]
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
}
// Enqueue of messages Sender::myPort::mUInt16
void enqueue_Sender_send_myPort_mUInt16(struct Sender_Instance *_instance, uint16_t p){
//[]
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
}
// Enqueue of messages Sender::myPort::mFloat
void enqueue_Sender_send_myPort_mFloat(struct Sender_Instance *_instance, float p){
//[]
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
}
// Enqueue of messages Sender::myPort::mBoolean
void enqueue_Sender_send_myPort_mBoolean(struct Sender_Instance *_instance, uint8_t p){
//[]
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
}
// Enqueue of messages Sender::myPort::mUInt8
void enqueue_Sender_send_myPort_mUInt8(struct Sender_Instance *_instance, uint8_t p){
//[]
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
}
// Enqueue of messages Receiver::myPort::ready
void enqueue_Receiver_send_myPort_ready(struct Receiver_Instance *_instance){
//[]
if ( fifo_byte_available() > 4 ) {

_fifo_enqueue( (14 >> 8) & 0xFF );
_fifo_enqueue( 14 & 0xFF );

// ID of the source instance
_fifo_enqueue( (_instance->id >> 8) & 0xFF );
_fifo_enqueue( _instance->id & 0xFF );
}
}

// Dispatch for messages Receiver::myPort::ready
void dispatch_Receiver_send_myPort_ready(struct Receiver_Instance *_instance){
if (_instance == &Serialization_test_Cfg_r_var) {
Sender_handle_myPort_ready(&Serialization_test_Cfg_s_var);
}
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

void processMessageQueue() {
if (fifo_empty()) return; // return if there is nothing to do

byte mbuf[10];
uint8_t mbufi = 0;

// Read the code of the next port/message in the queue
uint16_t code = fifo_dequeue() << 8;

code += fifo_dequeue();

// Switch to call the appropriate handler
switch(code) {
case 1:
while (mbufi < 3) mbuf[mbufi++] = fifo_dequeue();
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
dispatch_Sender_send_myPort_mEmpty((struct Sender_Instance*)instance_by_id((mbuf[0] << 8) + mbuf[1]) /* instance */);
break;
case 3:
while (mbufi < 4) mbuf[mbufi++] = fifo_dequeue();
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

// Init the ID, state variables and properties for instance Serialization_test_Cfg_r
Serialization_test_Cfg_r_var.id = add_instance( (void*) &Serialization_test_Cfg_r_var);
Serialization_test_Cfg_r_var.Receiver_SenderChart_State = RECEIVER_SENDERCHART_INIT_STATE;

// Init the ID, state variables and properties for instance Serialization_test_Cfg_s
Serialization_test_Cfg_s_var.id = add_instance( (void*) &Serialization_test_Cfg_s_var);
Serialization_test_Cfg_s_var.Sender_SenderChart_State = SENDER_SENDERCHART_INIT_STATE;

Receiver_SenderChart_OnEntry(RECEIVER_SENDERCHART_STATE, &Serialization_test_Cfg_r_var);
Sender_SenderChart_OnEntry(SENDER_SENDERCHART_STATE, &Serialization_test_Cfg_s_var);
}




void setup() {
Serial.begin(9600);
initialize_configuration_Serialization_test_Cfg();

}

void loop() {
Sender_handle_empty_event(&Serialization_test_Cfg_s_var);

    processMessageQueue();
}
