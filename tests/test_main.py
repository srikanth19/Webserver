from src.app.main import app


def test_healthz():
    c = app.test_client()
    r = c.get("/healthz")
    assert r.status_code == 200
