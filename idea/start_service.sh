#!/bin/bash

# Base directory path
BASE_DIR=~/Documents/Patrianna

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
echo "10) Kill process on a custom port"
echo "11) Spanner Emulator"
echo "12) Pub/Sub Emulator"
echo "Press Enter to build"
echo "---------------------------------"
read -p "Enter your choice (1-12, Enter): " choice

case $choice in
  1)
    echo "Starting Auth service..."
    set_title "1. Auth" & set_title_pid=$!  # Save the background process ID
    trap "kill $set_title_pid" EXIT  # Ensure the background process is killed
    cd "$BASE_DIR/crm/auth/server-endpoint"
    mvn spring-boot:run \
      --nsu \
      -Dspring-boot.run.useTestClasspath=true \
      -Dspring-boot.run.directories=target/test-classes \
      -Dspring-boot.run.main-class=auth.AuthServerTestStarter \
      -Dspring-boot.run.jvmArguments="-XX:+AllowRedefinitionToAddDeleteMethods -agentlib:jdwp=transport=dt_socket,server=y,suspend=n,address=127.0.0.1:8001"
    ;;
  2)
    echo "Starting Frontend service..."
    set_title "2. Frontend" & set_title_pid=$!
    trap "kill $set_title_pid" EXIT
    cd "$BASE_DIR/uam/frontend/server-endpoint"
    SPANNER_EMULATOR_HOST=localhost:9010 \
    mvn spring-boot:run \
      --nsu \
      -Dspring-boot.run.useTestClasspath=true \
      -Dspring-boot.run.directories=target/test-classes \
      -Dspring-boot.run.main-class=fe.UamFrontendTestStarter \
      -Dspring-boot.run.jvmArguments="-XX:+AllowRedefinitionToAddDeleteMethods -agentlib:jdwp=transport=dt_socket,server=y,suspend=n,address=127.0.0.1:8002"
    ;;
  3)
    echo "Starting CRM service..."
    set_title "3. CRM" & set_title_pid=$!
    trap "kill $set_title_pid" EXIT
    cd "$BASE_DIR/crm/server-endpoint"
    mvn spring-boot:run \
      --nsu \
      -Dspring-boot.run.useTestClasspath=true \
      -Dspring-boot.run.directories=target/test-classes \
      -Dspring-boot.run.main-class=uam.UamServerTestStarter \
      -Dspring-boot.run.jvmArguments="-XX:+AllowRedefinitionToAddDeleteMethods -agentlib:jdwp=transport=dt_socket,server=y,suspend=n,address=127.0.0.1:8003"
    ;;
  4)
    echo "Starting Payment service..."
    set_title "4. Payment" & set_title_pid=$!
    trap "kill $set_title_pid" EXIT
    cd "$BASE_DIR/payment/server-endpoint"
    mvn spring-boot:run \
      --nsu \
      -Dspring-boot.run.useTestClasspath=true \
      -Dspring-boot.run.directories=target/test-classes \
      -Dspring-boot.run.main-class=payment.PaymentServerTestStarter \
      -Dspring-boot.run.jvmArguments="-XX:+AllowRedefinitionToAddDeleteMethods -agentlib:jdwp=transport=dt_socket,server=y,suspend=n,address=127.0.0.1:8004"
    ;;
  5)
    echo "Starting Fraud service..."
    set_title "5. Fraud" & set_title_pid=$!
    trap "kill $set_title_pid" EXIT
    cd "$BASE_DIR/fraud/fraud/server-endpoint"
    mvn spring-boot:run \
      --nsu \
      -Dspring-boot.run.useTestClasspath=true \
      -Dspring-boot.run.directories=target/test-classes \
      -Dspring-boot.run.main-class=fraud.FraudServerTestStarter \
      -Dspring-boot.run.jvmArguments="-XX:+AllowRedefinitionToAddDeleteMethods -agentlib:jdwp=transport=dt_socket,server=y,suspend=n,address=127.0.0.1:8005"
    ;;
  6)
    echo "Starting Gateway service..."
    set_title "6. Gateway" & set_title_pid=$!
    trap "kill $set_title_pid" EXIT
    cd "$BASE_DIR/uam/gateway/server-endpoint"
    mvn spring-boot:run \
      --nsu \
      -Dspring-boot.run.useTestClasspath=true \
      -Dspring-boot.run.directories=target/test-classes \
      -Dspring-boot.run.main-class=gateway.UamGatewayTestStarter \
      -Dspring-boot.run.jvmArguments="-XX:+AllowRedefinitionToAddDeleteMethods -agentlib:jdwp=transport=dt_socket,server=y,suspend=n,address=127.0.0.1:8006"
    ;;
  7)
    echo "Starting Admin service..."
    set_title "7. Admin" & set_title_pid=$!
    trap "kill $set_title_pid" EXIT
    cd "$BASE_DIR/uam/admin-ui/server-endpoint"
    mvn spring-boot:run \
      --nsu \
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
    set_title "Spanner Emulator" & set_title_pid=$!
    trap "kill $set_title_pid" EXIT
    echo "Starting Spanner Emulator..."
    gcloud beta emulators spanner start
    ;;
  12)
    set_title "Pub/Sub Emulator" & set_title_pid=$!
    trap "kill $set_title_pid" EXIT
    echo "Starting Pub/Sub Emulator..."
    gcloud beta emulators pubsub start --host-port=0.0.0.0:8085
    ;;
  *)
    echo "Please select the project to build:"
    echo "---------------------------------"
    echo "1. turbospaces-boot"
    echo "2. uam-commons"
    echo "3. uam"
    echo "4. crm"
    echo "5. fraud"
    echo "6. payment"
    echo "-----------"
    echo "0. Build All offline"
    echo "000. Build All online"
    echo "---------------------------------"
    read -p "Enter your choice [1-7]: " build_choice

    case $build_choice in
      1)
        set_title "1. TURBOSPACES-BOOT is building" & set_title_pid=$!
        trap "kill $set_title_pid" EXIT
        cd "$BASE_DIR/turbospaces-boot" && mvn clean install -DskipTests -nsu
        ;;
      2)
        set_title "2. UAM-COMMONS is building" & set_title_pid=$!
        trap "kill $set_title_pid" EXIT
        cd "$BASE_DIR/uam-commons" && mvn clean install -DskipTests -nsu
        ;;
      3)
        set_title "3. CRM is building" & set_title_pid=$!
        trap "kill $set_title_pid" EXIT
        cd "$BASE_DIR/crm" && mvn clean install -DskipTests -nsu
        ;;
      4)
        set_title "4. UAM is building" & set_title_pid=$!
        trap "kill $set_title_pid" EXIT
        cd "$BASE_DIR/uam" && mvn clean install -DskipTests -nsu
        ;;	
      5)
        set_title "5. FRAUD is building" & set_title_pid=$!
        trap "kill $set_title_pid" EXIT
        cd "$BASE_DIR/fraud" && mvn clean install -DskipTests -nsu
        ;;
      6)
        set_title "6. PAYMENT is building" & set_title_pid=$!
        trap "kill $set_title_pid" EXIT
        cd "$BASE_DIR/payment" && mvn clean install -DskipTests -nsu
        ;;
      0)
        set_title "Building all projects OFFLINE" & set_title_pid=$!
        trap "kill $set_title_pid" EXIT
        cd "$BASE_DIR" && mvn clean install -T 8 -o -nsu
        ;;
      000)
        set_title "Building all projects ONLINE" & set_title_pid=$!
        trap "kill $set_title_pid" EXIT
        cd "$BASE_DIR" && mvn clean install -T 8 -nsu
        ;;
      *)
        echo "Invalid option."
        ;;
    esac
    ;;
esac
