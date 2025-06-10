# iac-webapp-stack

This repository contains Infrastructure as Code (IaC) modules and examples for deploying secure web applications and related resources on Azure using Terraform.

## Repository Structure

- **/azure/**  
  Contains Terraform code, modules, and documentation for deploying web applications and infrastructure on Azure.

- **/docs/**  
  Documentation assets such as architecture diagrams and supporting images.

## Features

- Modular Terraform code for reusable infrastructure components.
- Example configurations for deploying web applications, App Service Plans, Virtual Networks, and supporting resources.
- Best practices for managing Terraform state and Azure authentication.

## Getting Started

1. Review the documentation in `/azure/README.md` for detailed setup and deployment instructions.
2. Ensure you have the required tools installed:
   - [Terraform](https://www.terraform.io/)
   - [Azure CLI](https://docs.microsoft.com/en-us/cli/azure/install-azure-cli)
3. Clone this repository and follow the step-by-step guide in the Azure folder.

## Security

- **Do not commit secrets or sensitive credentials** to this repository.
- Use environment variables or Azure Key Vault for managing secrets.

## Contributing

Contributions are welcome! Please open issues or submit pull requests for improvements or bug fixes.

## License

This project is licensed under the MIT License.