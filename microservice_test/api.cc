#include "include/crow_all.h"
#include "include/func.hpp"

int main() {
    crow::SimpleApp app;
    CROW_ROUTE(app, "/demo")(&test);
    app.multithreaded().port(5000).run();
    return 0;
}