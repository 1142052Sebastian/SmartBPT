#include <SPI.h>
#include <WiFi101.h>
#include <PubSubClient.h>

const char* ssid = "Vodafone_Ana";
const char* password = "BiroM1981";

const char* mqttServer = "3a2151781cb047b48cf28ea12b1bec5f.s2.eu.hivemq.cloud";
const int mqttPort = 1883;
const char* mqttUsername = "SMARTBPT";
const char* mqttPassword = "SmartBPT_1";
const char* mqttTopic = "nome_topic_MQTT";

int ledContatore = 0;
int counter = 0;


WiFiClient wifiClient;
PubSubClient mqttClient(wifiClient);

// Funzione connessione al Wi-Fi
void connectWiFi() {
  Serial.print("Connessione al Wi-Fi...");
  while (WiFi.status() != WL_CONNECTED) {
    WiFi.begin(ssid, password);
    delay(1000);
    Serial.print(".");
  }
  Serial.println();
  Serial.println("Connessione Wi-Fi stabilita!");
}

// Funzione connessione al server MQTT
void connectMQTT() {
  while (!mqttClient.connected()) {
    Serial.print("Connessione al server MQTT...");
    if (mqttClient.connect("ArduinoClient", mqttUsername, mqttPassword)) {
      Serial.println("Connesso al server MQTT!");
    } else {
      Serial.print("Errore di connessione MQTT, codice di stato: ");
      Serial.print(mqttClient.state());
      Serial.println(" Riprovo tra 5 secondi...");
      delay(5000);
    }
  }
}

int generateRandomValue() {
  return random(2);
}

// Funzione di invio del valore di "counter" al server MQTT
void publishCounterValue() {
  char counterValue[10];
  sprintf(counterValue, "%d", counter);
  mqttClient.publish(mqttTopic, counterValue);
  Serial.print("Counter: ");
  Serial.println(counter);
}

void setup() {
  Serial.begin(9600);
  connectWiFi();
  mqttClient.setServer(mqttServer, mqttPort);
  randomSeed(analogRead(A0));  // Inizializza il generatore di numeri casuali
}

void loop() {
  if (!mqttClient.connected()) {
    connectMQTT();
  }
  mqttClient.loop();

  ledContatore = generateRandomValue();

  if (ledContatore == 1) {
    counter++;
  }

  // Invia il valore del counter al server MQTT ogni 60 secondi
  static unsigned long lastPublishTime = 0;
  unsigned long currentTime = millis();
  if (currentTime - lastPublishTime >= 60000) {
    publishCounterValue();
    lastPublishTime = currentTime;
  }
}
