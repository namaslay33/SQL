-- --
-- -- PostgreSQL database dump
-- --

-- SET statement_timeout = 0;
-- SET lock_timeout = 0;
-- SET client_encoding = 'UTF8';
-- SET standard_conforming_strings = on;
-- SET check_function_bodies = false;
-- SET client_min_messages = warning;

-- --
-- -- Name: plpgsql; Type: EXTENSION; Schema: -; Owner:
-- --

-- CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


-- --
-- -- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner:
-- --

-- COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


-- SET search_path = public, pg_catalog;

-- SET default_tablespace = '';

-- SET default_with_oids = false;

-- --
-- -- Name: project; Type: TABLE; Schema: public; Owner: airportyh; Tablespace:
-- --

-- CREATE TABLE project (
--     id integer NOT NULL,
--     name character varying
-- );



-- --
-- -- Name: project_id_seq; Type: SEQUENCE; Schema: public; Owner: airportyh
-- --

-- CREATE SEQUENCE project_id_seq
--     START WITH 1
--     INCREMENT BY 1
--     NO MINVALUE
--     NO MAXVALUE
--     CACHE 1;



-- --
-- -- Name: project_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: airportyh
-- --

-- ALTER SEQUENCE project_id_seq OWNED BY project.id;


-- --
-- -- Name: project_uses_tech; Type: TABLE; Schema: public; Owner: airportyh; Tablespace:
-- --

-- CREATE TABLE project_uses_tech (
--     project_id integer,
--     tech_id integer
-- );



-- --
-- -- Name: tech; Type: TABLE; Schema: public; Owner: airportyh; Tablespace:
-- --

-- CREATE TABLE tech (
--     id integer NOT NULL,
--     name character varying
-- );



-- --
-- -- Name: tech_id_seq; Type: SEQUENCE; Schema: public; Owner: airportyh
-- --

-- CREATE SEQUENCE tech_id_seq
--     START WITH 1
--     INCREMENT BY 1
--     NO MINVALUE
--     NO MAXVALUE
--     CACHE 1;



-- --
-- -- Name: tech_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: airportyh
-- --

-- ALTER SEQUENCE tech_id_seq OWNED BY tech.id;


-- --
-- -- Name: id; Type: DEFAULT; Schema: public; Owner: airportyh
-- --

-- ALTER TABLE ONLY project ALTER COLUMN id SET DEFAULT nextval('project_id_seq'::regclass);


-- --
-- -- Name: id; Type: DEFAULT; Schema: public; Owner: airportyh
-- --

-- ALTER TABLE ONLY tech ALTER COLUMN id SET DEFAULT nextval('tech_id_seq'::regclass);


-- --
-- -- Data for Name: project; Type: TABLE DATA; Schema: public; Owner: airportyh
-- --

-- COPY project (id, name) FROM stdin;
-- 1	School Bus
-- 2	Medium Blog Layout
-- 3	Mozilla Front Page
-- 4	Personal Website
-- 5	Modal Dialog
-- 6	CSS Tricks Blog Layout
-- 7	Whiteboard Exercises
-- 8	RPG Hero Game
-- 9	Catch the Monster Game
-- 10	Phone Book
-- 11	Turtle Graphics Exercises
-- \.


-- --
-- -- Name: project_id_seq; Type: SEQUENCE SET; Schema: public; Owner: airportyh
-- --

-- SELECT pg_catalog.setval('project_id_seq', 11, true);


-- --
-- -- Data for Name: project_uses_tech; Type: TABLE DATA; Schema: public; Owner: airportyh
-- --

-- COPY project_uses_tech (project_id, tech_id) FROM stdin;
-- 1	1
-- 1	2
-- 2	1
-- 2	2
-- 3	1
-- 3	2
-- 3	9
-- 4	1
-- 4	2
-- 5	1
-- 5	2
-- 6	1
-- 6	2
-- 8	4
-- 9	4
-- 9	6
-- 10	4
-- 11	4
-- 11	5
-- 8	10
-- 9	10
-- 10	11
-- 10	12
-- \.


-- --
-- -- Data for Name: tech; Type: TABLE DATA; Schema: public; Owner: airportyh
-- --

-- COPY tech (id, name) FROM stdin;
-- 1	HTML
-- 2	CSS
-- 3	JavaScript
-- 4	Python
-- 5	Turtle Graphics
-- 6	PyGame
-- 7	Java
-- 8	Ruby
-- 9	Bootstrap
-- 10	Objects
-- 11	File IO
-- 12	Pickle
-- \.


-- --
-- -- Name: tech_id_seq; Type: SEQUENCE SET; Schema: public; Owner: airportyh
-- --

-- SELECT pg_catalog.setval('tech_id_seq', 12, true);


-- --
-- -- Name: project_pkey; Type: CONSTRAINT; Schema: public; Owner: airportyh; Tablespace:
-- --

-- ALTER TABLE ONLY project
--     ADD CONSTRAINT project_pkey PRIMARY KEY (id);


-- --
-- -- Name: tech_pkey; Type: CONSTRAINT; Schema: public; Owner: airportyh; Tablespace:
-- --

-- ALTER TABLE ONLY tech
--     ADD CONSTRAINT tech_pkey PRIMARY KEY (id);


-- --
-- -- Name: project_uses_tech_project_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: airportyh
-- --

-- ALTER TABLE ONLY project_uses_tech
--     ADD CONSTRAINT project_uses_tech_project_id_fkey FOREIGN KEY (project_id) REFERENCES project(id);


-- --
-- -- Name: project_uses_tech_tech_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: airportyh
-- --

-- ALTER TABLE ONLY project_uses_tech
--     ADD CONSTRAINT project_uses_tech_tech_id_fkey FOREIGN KEY (tech_id) REFERENCES tech(id);


-- --
-- -- Name: public; Type: ACL; Schema: -; Owner: airportyh
-- --

-- REVOKE ALL ON SCHEMA public FROM PUBLIC;
-- GRANT ALL ON SCHEMA public TO PUBLIC;


-- --
-- -- PostgreSQL database dump complete
-- --

-- 1. What are all projects that use JavaScript?
-- SELECT * 
-- FROM project, project_uses_tech
-- WHERE project.id = project_uses_tech.project_id and tech_id = 3;

-- or do it this other way....

-- SELECT *
-- FROM project
-- INNER JOIN project_uses_tech on project.id = project_uses_tech.project_id where tech_id = 3;

-- 2. What are all technologies used by the Personal Website?
-- SELECT *
-- FROM project_uses_tech, tech
-- WHERE project_uses_tech.tech_id = tech.id and project_id = 3;

-- 3. Perform a left outer join from the tech table to the project_uses_tech table 
-- - which techs has no associated project?
-- SELECT * 
-- FROM tech
-- left outer join
-- project_uses_tech on tech.id = project_uses_tech.tech_id where project_id is NULL;

-- 4. Based on the previous query, get the count of the number of techs used by each project.
-- SELECT project.name , COUNT(tech_id)
-- FROM project_uses_tech
-- left outer join
-- project on project.id = project_uses_tech.project_id GROUP BY project.name;

-- 5. Perform a left outer join from the project table to the project_users_tech table 
-- - which projects has no associated tech?
-- SELECT project.name, tech_id
-- FROM project
-- left outer join
-- project_uses_tech on project.id = project_uses_tech.project_id where tech_id is NULL;

-- 6. Based on the previous query, get the count of the number of projects that use each tech.
-- SELECT tech.name, COUNT(project_id)
-- FROM tech
-- left outer join
-- project_uses_tech on tech.id = project_uses_tech.tech_id GROUP by tech.name;

-- 7. List all projects along with each technology used by it. You will need to do a three-way join.
-- SELECT project.name, tech.name
-- FROM project
-- left outer join
-- project_uses_tech on project.id = project_uses_tech.project_id 
-- left outer join
-- tech on tech.id = project_uses_tech.tech_id
-- GROUP BY project.name, tech.name;

-- 8. List all the distinct techs that are used by at least one project.
-- SELECT DISTINCT tech.name
-- FROM tech
-- left outer join
-- project_uses_tech on tech.id = project_uses_tech.tech_id and project_id is NOT NULL;

-- 9. List all the distinct techs that are not used by any projects.
-- SELECT DISTINCT tech.name, project_uses_tech.project_id
-- FROM tech
-- left outer join
-- project_uses_tech on tech.id = project_uses_tech.tech_id WHERE project_id is NULL;

-- 10. List all the distinct projects that use at least one tech.
-- SELECT DISTINCT project.name
-- FROM project_uses_tech
-- left outer join
-- project on project_uses_tech.project_id = project.id; 

-- 11. List all the distinct projects that use no tech.
-- SELECT DISTINCT project.name
-- FROM project
-- left outer join
-- project_uses_tech on project.id = project_uses_tech.project_id WHERE project_uses_tech.tech_id is NULL;

-- 12. Order the projects by how many tech it uses.
-- SELECT project.name, COUNT(project_uses_tech.project_id)
-- FROM project
-- left outer join
-- project_uses_tech on project.id = project_uses_tech.project_id 
-- GROUP BY project.name
-- ORDER BY COUNT(project_uses_tech.project_id) DESC;

-- 13. Order the tech by how many projects use it.
-- SELECT tech.name, COUNT(project_uses_tech.tech_id)
-- FROM tech
-- left outer join
-- project_uses_tech on tech.id = project_uses_tech.tech_id
-- GROUP BY tech.name
-- ORDER BY COUNT(project_uses_tech.tech_id) DESC;

-- 14. What is the average number of techs used by a project?
SELECT AVG(count) 
FROM(
    SELECT project.name, COUNT(project_uses_tech.project_id) AS count
    FROM project
    left outer join project_uses_tech 
    on project.id = project_uses_tech.project_id
    GROUP BY project.name, project_uses_tech.project_id
    ORDER BY COUNT(project_uses_tech.project_id) DESC
) as counts;

