package ru.itmo.lab.web_lab2.servlets;

import jakarta.servlet.Servlet;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import ru.itmo.lab.web_lab2.model.Data;
import ru.itmo.lab.web_lab2.validation.Validation;


import java.io.IOException;
import java.time.Duration;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

public class AreaCheckServlet extends HttpServlet implements Servlet {
    Validation validation;

    @Override
    public void init() {
        this.validation = new Validation();
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
        float x;
        float y;
        float r;
        LocalDateTime startDate;
        boolean result;
        long executeTime;
        HttpSession session = req.getSession();
        addListInSession(session);
        List<Data> retrievedList = (List<Data>) session.getAttribute("listData");
        Data data = new Data();
        try {
            x = Float.parseFloat(req.getParameter("x"));
            y = Float.parseFloat(req.getParameter("y"));
            r = Float.parseFloat(req.getParameter("r"));
            startDate = LocalDateTime.now();
            result = validation.isHit(x, y, r);
            LocalDateTime endDate = LocalDateTime.now();
            executeTime = Duration.between(startDate, endDate).toNanos() / 1000;
        } catch (NumberFormatException | NullPointerException e) {
            resp.sendError(400);
            return;
        }
        data.setX(x);
        data.setY(y);
        data.setR(r);
        data.setStartDate(startDate);
        data.setResult(result);
        data.setExecuteTime(executeTime);
        retrievedList.add(data);
        String path = getServletContext().getContextPath();
        req.setAttribute("x", x);
        req.setAttribute("y", y);
        req.setAttribute("r", r);
        req.setAttribute("executeTime", executeTime);
        req.setAttribute("result", result);
        req.setAttribute("startDate", startDate);
        getServletContext().getRequestDispatcher("/tablePage.jsp").forward(req, resp);
    }

    public void addListInSession(HttpSession session) {
        if (session.getAttribute("listData") == null) {
            session.setAttribute("listData", new ArrayList<Data>() {
            });
        }
    }
}
