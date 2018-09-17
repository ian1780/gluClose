int analogInput = A0;
int threshold = 5;
double val = 0.0;
void setup(){
   pinMode(analogInput, INPUT); //assigning the input port
   Serial.begin(9600); //BaudRate
}
void loop(){
   val = analogRead(analogInput);//reads the analog input
   //Serial.print("VAL = ");
   //Serial.println(val);
   if((val > threshold) && (!(val >= 45)))
   {
     Serial.println(1);
   }
   else
   {
     Serial.println(0);
   }
delay(1000); 
}