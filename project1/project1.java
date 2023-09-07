import java.util.Scanner;

public class project1 {
    public static void main(String[] args) {
        // setup variables to be used later on in the program
        boolean exit = false;
        double result = 0.0;
        double num1 = 0.0;
        double num2 = 0.0;
        // create scanner object to take user input
        Scanner scanner = new Scanner(System.in);

        // keep runing program until the user chooses to quit
        while (exit == false) {
            // print menu choices
            System.out.println("Welcome to Basic Calculator");
            System.out.println("===========================");
            System.out.println();
            System.out.println("1. Add Operation");
            System.out.println("2. Subtract Operation");
            System.out.println("3. Multiply Operation");
            System.out.println("4. Divide Operation");
            System.out.println("5. Exit");
            System.out.println();
            System.out.println("selection >");

            // take user input for what operation to preform
            int choice = scanner.nextInt();

            // take two numbers to preform the option if not chosen to quit
            if (choice != 5) {
                System.out.print("Enter the first number: ");
                num1 = scanner.nextDouble();

                System.out.print("Enter the second number: ");
                num2 = scanner.nextDouble();
            }

            // preform the operation of the numbers according to the chosen operation
            switch (choice) {
                case 1:
                    result = num1 + num2;
                    System.out.println("Result: " + result);
                    break;
                case 2:
                    result = num1 - num2;
                    System.out.println("Result: " + result);
                    break;
                case 3:
                    result = num1 * num2;
                    System.out.println("Result: " + result);
                    break;
                case 4:
                    if (num2 != 0) {
                        result = num1 / num2;
                        System.out.println("Result: " + result);
                    } else {
                        System.out.println("Error: Division by zero");
                    }
                    break;
                case 5:
                    exit = true;
                    break;
                default:
                    System.out.println(("Invalid input. Please choose input again"));
            }
        }
        scanner.close();
    }
}