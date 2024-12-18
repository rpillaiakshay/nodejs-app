const request = require('supertest');
const app = require('../app/server.js');

describe('GET /', () => {
	  it('should return Hello World!', async () => {
		      const response = await request(app).get('/');
		      expect(response.text).toBe('Hello World!');
		      expect(response.statusCode).toBe(200);
		    });
});
