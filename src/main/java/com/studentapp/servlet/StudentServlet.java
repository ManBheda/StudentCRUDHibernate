package com.studentapp.servlet;

import com.studentapp.dao.StudentDao;
import com.studentapp.model.Student;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/student")
public class StudentServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;
    private StudentDao dao;

    @Override
    public void init() throws ServletException {
        dao = new StudentDao();
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        String action = req.getParameter("action");
        if (action == null) action = "list";

        switch (action) {
            case "new":
                req.getRequestDispatcher("student-form.jsp")
                   .forward(req, resp);
                break;

            case "edit":
                int id = Integer.parseInt(req.getParameter("id"));
                Student student = dao.getStudent(id);
                req.setAttribute("student", student);
                req.getRequestDispatcher("student-form.jsp")
                   .forward(req, resp);
                break;

            case "delete":
                dao.deleteStudent(Integer.parseInt(req.getParameter("id")));
                resp.sendRedirect("student");
                break;

            default:  // "list"
                List<Student> list = dao.getAllStudents();
                req.setAttribute("students", list);
                req.getRequestDispatcher("student-list.jsp")
                   .forward(req, resp);
                break;
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        String idStr = req.getParameter("id");
        int id = (idStr == null || idStr.isEmpty()) ? 0 : Integer.parseInt(idStr);

        Student student = new Student();
        student.setId(id);
        student.setName(req.getParameter("name"));
        student.setEmail(req.getParameter("email"));

        dao.saveStudent(student);
        resp.sendRedirect("student");
    }
}
