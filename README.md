# k8s-node-server

A Node.js server application designed for containerization and deployment on Kubernetes.

## Description

This project implements a backend service using Node.js. It is configured to be built as a Docker container and orchestrated via Kubernetes manifests.

## Prerequisites

- [Node.js](https://nodejs.org/) (LTS version recommended)
- [Docker](https://www.docker.com/)
- [Kubernetes CLI (kubectl)](https://kubernetes.io/docs/tasks/tools/)

## Installation

1. Clone the repository:
   ```bash
   git clone <repository-url>
   cd k8s-node-server
   ```

2. Install dependencies:
   ```bash
   npm install
   ```

## Development

To run the server locally for development:

```bash
npm start
# or
node index.js
```

Ensure you have a `.env` file created based on your configuration needs (this file is git-ignored by default).

## Docker Support

### Build the Image

```bash
docker build -t k8s-node-server:latest .
```

### Run Container Locally

```bash
docker run -p 3000:3000 --env-file .env k8s-node-server:latest
```

## Kubernetes Deployment

1. **Apply Deployment**:
   ```bash
   kubectl apply -f k8s/deployment.yaml
   ```

2. **Apply Service**:
   ```bash
   kubectl apply -f k8s/service.yaml
   ```

## License

MIT
