Here's an enhanced README file that includes detailed instructions for setting up, running, and maintaining your project, along with project details for easy reference. This format is suitable for an open-source repository.

---

# FastAPI SSO Authentication

## Project Overview

This project is an authentication system that supports email-based registration, login, password management, and social login (Google OAuth). It is built using FastAPI and includes Docker support for easy deployment.

## Project Structure

```
Dockerfile
├── Makefile
├── README.md
├── app
│   ├── __init__.py
│   ├── database.py
│   ├── decorators
│   │   └── user.py
│   ├── enums
│   │   ├── email_subject_keys.py
│   │   ├── error_messages.py
│   │   ├── response_messages.py
│   │   └── steps.py
│   ├── interfaces
│   │   ├── login.py
│   │   └── response.py
│   ├── main.py
│   ├── middlewares
│   │   └── validation_exception_handler.py
│   ├── modules
│   │   ├── auth
│   │   │   ├── auth_route.py
│   │   │   ├── auth_service.py
│   │   │   └── schemas
│   │   │       ├── forgot_password.py
│   │   │       ├── identify.py
│   │   │       ├── link_account.py
│   │   │       ├── login.py
│   │   │       ├── register.py
│   │   │       ├── reset_password.py
│   │   │       └── verify_email.py
│   │   ├── social_auth
│   │   │   ├── social_auth_route.py
│   │   │   └── social_auth_service.py
│   │   └── user
│   │       ├── schemas
│   │       │   ├── update_password.py
│   │       │   └── update_profile.py
│   │       ├── user_model.py
│   │       ├── user_route.py
│   │       └── user_service.py
│   ├── services
│   │   ├── auth_helper.py
│   │   └── email.py
│   ├── templates
│   │   ├── forgot_password.html
│   │   ├── password_reset_confirmation.html
│   │   ├── registration.html
│   │   ├── resend_otp.html
│   │   └── welcome.html
│   └── utils
│       ├── raise_exception.py
│       └── raise_response.py
├── poetry.lock
└── pyproject.toml
```

## Setup Instructions

### Prerequisites

- Python 3.8+
- Docker
- Poetry

### Installation

1. **Clone the repository:**
    ```sh
    git clone https://github.com/Renesis-Tech-Inc/fastapi-sso-auth.git
    cd sso-auth
    ```

2. **Install dependencies:**
    ```sh
    poetry install
    ```

### Running the Application

You can run the application in several ways: locally, using Docker, or using Poetry.

#### Running Locally

To run the FastAPI application locally with Poetry:
```sh
poetry run uvicorn app.main:app --host 0.0.0.0 --port 3000
```

#### Running with Docker

1. **Build the Docker image:**
    ```sh
    docker build -t sso-auth:latest .
    ```

2. **Run the Docker container:**
    ```sh
    docker run --name sso-auth_container -p 8000:8000 sso-auth:latest
    ```

### Makefile Commands

The `Makefile` provides convenient commands for common tasks:

- **Format code with Black:**
    ```sh
    make format
    ```

- **Run the application:**
    ```sh
    make run
    ```

- **Install dependencies:**
    ```sh
    make install
    ```

- **Docker commands:**
    - Build the Docker image:
        ```sh
        make docker-build
        ```
    - Run the Docker container:
        ```sh
        make docker-run
        ```
    - Stop the Docker container:
        ```sh
        make docker-stop
        ```
    - Remove the Docker container:
        ```sh
        make docker-remove
        ```
    - Clean up Docker images:
        ```sh
        make docker-clean
        ```
    - Rebuild and run the Docker container:
        ```sh
        make docker-rebuild
        ```

- **Run locally with Poetry:**
    ```sh
    make run-local
    ```

## Authentication Endpoints

The project includes various authentication endpoints, including:

- `/identify`: Identify user by email.
- `/register`: Register a new user.
- `/login`: Log in a user.
- `/verify-email`: Verify user's email using OTP.
- `/forgot-password`: Handle forgot password process.
- `/resend-otp`: Resend OTP to user's email.
- `/reset-password`: Reset user's password using email or OTP.

## Social Authentication

The project supports Google OAuth for social authentication:

- `/google`: Initiates Google OAuth login process.
- `/google/callback`: Handles Google OAuth callback for user verification and redirection.
- `/link-accounts`: Handles linking of user accounts from different providers.

## User Management Endpoints

- `/`: Get the authenticated user's profile.
- `/{user_id}`: Get a user by their ID.
- `/`: Update a user's profile information.
- `/password`: Update a user's password.

## Contributing

Contributions are welcome! Please fork the repository and create a pull request.

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.

---

This README file provides comprehensive instructions and details about the project, making it easier for others to understand, set up, and contribute to your project.