#!/bin/bash

# Base directory path
BASE_DIR=~/Documents/

# Function to keep the terminal title
function set_title {
    while true; do
        echo -n -e "\033]0;$1\007"
        sleep 1
    done
}

# Main menu
echo "Select the service you want to start:"
echo "---------------------------------"
echo "1) Auth"
echo "2) Frontend"
echo "3) CRM"
echo "4) Payment"
echo "5) Fraud"
echo "6) Gateway"
echo "7) Admin"
echo "-----------"
echo "000) Build projects"
echo "10) Kill process on a custom port"
echo "11) Spanner Emulator"
echo "12) Pub/Sub Emulator"
echo "---------------------------------"
read -p "Enter your choice (1-12, 000): " choice

case $choice in
  1)
    echo "Starting Auth service..."
    (set_title "1. Auth" &)
    trap "kill $!" EXIT
    cd "$BASE_DIR/crm/auth/server-endpoint"
    mvn spring-boot:run \
      -Dspring-boot.run.useTestClasspath=true \
      -Dspring-boot.run.directories=target/test-classes \
      -Dspring-boot.run.main-class=auth.AuthServerTestStarter \
      -Dspring-boot.run.jvmArguments="-XX:+AllowRedefinitionToAddDeleteMethods -agentlib:jdwp=transport=dt_socket,server=y,suspend=n,address=127.0.0.1:8001"
    ;;
  2)
    echo "Starting Frontend service..."
    (set_title "2. Frontend" &)
    trap "kill $!" EXIT
    cd "$BASE_DIR/uam/frontend/server-endpoint"
    SPANNER_EMULATOR_HOST=localhost:9010 \
    mvn spring-boot:run \
      -Dspring-boot.run.useTestClasspath=true \
      -Dspring-boot.run.directories=target/test-classes \
      -Dspring-boot.run.main-class=fe.UamFrontendTestStarter \
      -Dspring-boot.run.jvmArguments="-XX:+AllowRedefinitionToAddDeleteMethods -agentlib:jdwp=transport=dt_socket,server=y,suspend=n,address=127.0.0.1:8002"
    ;;
  3)
    echo "Starting CRM service..."
    (set_title "3. CRM" &)
    trap "kill $!" EXIT
    cd "$BASE_DIR/crm/server-endpoint"
    mvn spring-boot:run \
      -Dspring-boot.run.useTestClasspath=true \
      -Dspring-boot.run.directories=target/test-classes \
      -Dspring-boot.run.main-class=uam.UamServerTestStarter \
      -Dspring-boot.run.jvmArguments="-XX:+AllowRedefinitionToAddDeleteMethods -agentlib:jdwp=transport=dt_socket,server=y,suspend=n,address=127.0.0.1:8003"
    ;;
  4)
    echo "Starting Payment service..."
    (set_title "4. Payment" &)
    trap "kill $!" EXIT
    cd "$BASE_DIR/payment/server-endpoint"
    mvn spring-boot:run \
      -Dspring-boot.run.useTestClasspath=true \
      -Dspring-boot.run.directories=target/test-classes \
      -Dspring-boot.run.main-class=payment.PaymentServerTestStarter \
      -Dspring-boot.run.jvmArguments="-XX:+AllowRedefinitionToAddDeleteMethods -agentlib:jdwp=transport=dt_socket,server=y,suspend=n,address=127.0.0.1:8004"
    ;;
  5)
    echo "Starting Fraud service..."
    (set_title "5. Fraud" &)
    trap "kill $!" EXIT
    cd "$BASE_DIR/fraud/fraud/server-endpoint"
    mvn spring-boot:run \
      -Dspring-boot.run.useTestClasspath=true \
      -Dspring-boot.run.directories=target/test-classes \
      -Dspring-boot.run.main-class=fraud.FraudServerTestStarter \
      -Dspring-boot.run.jvmArguments="-XX:+AllowRedefinitionToAddDeleteMethods -agentlib:jdwp=transport=dt_socket,server=y,suspend=n,address=127.0.0.1:8005"
    ;;
  6)
    echo "Starting Gateway service..."
    (set_title "6. Gateway" &)
    trap "kill $!" EXIT
    cd "$BASE_DIR/uam/gateway/server-endpoint"
    mvn spring-boot:run \
      -Dspring-boot.run.useTestClasspath=true \
      -Dspring-boot.run.directories=target/test-classes \
      -Dspring-boot.run.main-class=gateway.UamGatewayTestStarter \
      -Dspring-boot.run.jvmArguments="-XX:+AllowRedefinitionToAddDeleteMethods -agentlib:jdwp=transport=dt_socket,server=y,suspend=n,address=127.0.0.1:8006"
    ;;
  7)
    echo "Starting Admin service..."
    (set_title "7. Admin" &)
    trap "kill $!" EXIT
    cd "$BASE_DIR/uam/admin-ui/server-endpoint"
    mvn spring-boot:run \
      -Dspring-boot.run.useTestClasspath=true \
      -Dspring-boot.run.directories=target/test-classes \
      -Dspring-boot.run.main-class=admin.AdminAppTestStarter \
      -Dspring-boot.run.jvmArguments="-XX:+AllowRedefinitionToAddDeleteMethods -agentlib:jdwp=transport=dt_socket,server=y,suspend=n,address=127.0.0.1:8007"
    ;;
  10)
    read -p "Enter the port number to kill: " port
    if [[ ! -z "$port" ]]; then
      echo "Killing process on port $port..."
      kill -9 $(lsof -ti:$port)
      if [[ $? -eq 0 ]]; then
        echo "Process on port $port killed."
      else
        echo "No process found on port $port, or unable to kill."
      fi
    else
      echo "No port number entered. Exiting..."
    fi
    ;;
  11)
    echo -n -e "\033]0;Spanner Emulator\007"
    echo "Starting Spanner Emulator..."
    gcloud beta emulators spanner start
    ;;
  12)
    echo -n -e "\033]0;Pub/Sub Emulator\007"
    echo "Starting Pub/Sub Emulator..."
    gcloud beta emulators pubsub start --host-port=0.0.0.0:8085
    ;;
  000)
    echo "Please select the project to build:"
    echo "---------------------------------"
    echo "1. turbospaces-boot"
    echo "2. uam-commons"
    echo "3. uam"
    echo "4. crm"
    echo "5. fraud"
    echo "6. payment"
    echo "-----------"
    echo "0. Build All"
    echo "---------------------------------"
    read -p "Enter your choice [1-7]: " build_choice

    case $build_choice in
      1)
        cd "$BASE_DIR/turbospaces-boot" && mvn clean install -DskipTests
        ;;
      2)
        cd "$BASE_DIR/uam-commons" && mvn clean install -DskipTests
        ;;
      3)
        cd "$BASE_DIR/uam" && mvn clean install -DskipTests
        ;;
      4)
        cd "$BASE_DIR/crm" && mvn clean install -DskipTests
        ;;
      5)
        cd "$BASE_DIR/fraud" && mvn clean install -DskipTests
        ;;
      6)
        cd "$BASE_DIR/payment" && mvn clean install -DskipTests
        ;;
      0)
        cd "$BASE_DIR/turbospaces-boot" && mvn clean install -DskipTests &&
        cd "$BASE_DIR/uam-commons" && mvn clean install -DskipTests &&
        cd "$BASE_DIR/uam" && mvn clean install -DskipTests &&
        cd "$BASE_DIR/crm" && mvn clean install -DskipTests &&
        cd "$BASE_DIR/fraud" && mvn clean install -DskipTests &&
        cd "$BASE_DIR/payment" && mvn clean install -DskipTests
        ;;
      *)
        echo "Invalid choice. Exiting..."
        exit 1
        ;;
    esac
    ;;
  *)
    echo "Invalid choice. Exiting..."
    ;;
esac
