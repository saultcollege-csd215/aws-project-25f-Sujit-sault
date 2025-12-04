# Purpose and Benefits of Using nginx as a Reverse Proxy

## Purpose:
nginx acts as a reverse proxy that sits between clients (web browsers) and the Flask application. It receives HTTP requests on port 80 and forwards them to the Flask app running on localhost:5000 via gunicorn.

## Benefits:

1. **Security**:
   - Acts as a protective barrier between the internet and the Flask application
   - Hides the actual application server (gunicorn/Flask) from direct exposure
   - Can implement security features like rate limiting, IP filtering, and DDoS protection

2. **Performance**:
   - Efficiently handles multiple concurrent connections
   - Can serve static files (HTML, CSS, JavaScript, images) directly without involving Flask
   - Implements response caching to reduce load on the Flask application

3. **Load Distribution**:
   - Distributes incoming requests across multiple gunicorn worker processes
   - Can be extended to load balance across multiple backend servers

4. **SSL/TLS Termination**:
   - Can handle HTTPS encryption/decryption, offloading this CPU-intensive task from Flask
   - Allows the Flask app to focus on application logic

5. **Reliability and High Availability**:
   - Can perform health checks on backend servers
   - Routes traffic away from failed application instances
   - Provides fault tolerance

6. **Flexibility**:
   - Enables hosting multiple applications on the same server
   - Allows URL rewriting and request/response modification
   - Simplifies deployment of new versions (can do blue-green deployments)

In this specific setup:
- nginx listens on port 80 (standard HTTP port)
- Flask app runs via gunicorn on port 5000 (internal only)
- nginx forwards all requests to 127.0.0.1:5000
- External clients only interact with nginx, not directly with Flask