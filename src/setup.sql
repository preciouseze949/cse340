
-- ========================================
--  Organizations
-- ========================================
CREATE TABLE organization (
    organization_id SERIAL PRIMARY KEY,
    name VARCHAR(150) NOT NULL,
    description TEXT NOT NULL,
    contact_email VARCHAR(255) NOT NULL,
    logo_filename VARCHAR(255) NOT NULL
);
-- ========================================
-- Insert sample data: Organizations
-- ========================================
INSERT INTO organization (name, description, contact_email, logo_filename)
VALUES
('BrightFuture Builders', 'A nonprofit focused on improving community infrastructure through sustainable construction projects.', 'info@brightfuturebuilders.org', 'brightfuture-logo.png'),
('GreenHarvest Growers', 'An urban farming collective promoting food sustainability and education in local neighborhoods.', 'contact@greenharvest.org', 'greenharvest-logo.png'),
('UnityServe Volunteers', 'A volunteer coordination group supporting local charities and service initiatives.', 'hello@unityserve.org', 'unityserve-logo.png');

-- ========================================
-- SERVICE PROJECT TABLE
-- ========================================

CREATE TABLE service_project (
    project_id SERIAL PRIMARY KEY,
    organization_id INTEGER NOT NULL,
    title VARCHAR(150) NOT NULL,
    description TEXT NOT NULL,
    location VARCHAR(200) NOT NULL,
    project_date DATE NOT NULL,

    CONSTRAINT fk_service_project_organization
        FOREIGN KEY (organization_id)
        REFERENCES organization (organization_id)
);

-- ========================================
-- INSERT 15 SAMPLE SERVICE PROJECTS
-- ========================================

INSERT INTO service_project
    (organization_id, title, description, location, project_date)

SELECT
    o.organization_id,
    p.title,
    p.description,
    p.location,
    p.project_date::DATE
FROM (
    VALUES
    -- BrightFuture Builders
    (
        'BrightFuture Builders',
        'Community School Renovation',
        'Help renovate classrooms and improve learning facilities for local students.',
        'Ondo City',
        '2026-12-05'
    ),
    (
        'BrightFuture Builders',
        'Clean Water Initiative',
        'Assist with the construction and improvement of community water facilities.',
        'Akure',
        '2026-12-12'
    ),
    (
        'BrightFuture Builders',
        'Community Housing Support',
        'Support local housing improvements for families in need.',
        'Ondo City',
        '2026-12-19'
    ),
    (
        'BrightFuture Builders',
        'Public Library Improvement',
        'Help repair and improve a public library for community learning.',
        'Owo',
        '2027-01-09'
    ),
    (
        'BrightFuture Builders',
        'Youth Skills Centre Project',
        'Assist with improving a centre where young people can learn practical skills.',
        'Akure',
        '2027-01-16'
    ),

    -- GreenHarvest Growers
    (
        'GreenHarvest Growers',
        'Community Tree Planting',
        'Plant trees to improve the local environment and promote sustainability.',
        'Ondo City',
        '2026-12-06'
    ),
    (
        'GreenHarvest Growers',
        'Urban Vegetable Garden',
        'Help establish a vegetable garden to encourage local food production.',
        'Akure',
        '2026-12-13'
    ),
    (
        'GreenHarvest Growers',
        'Environmental Cleanup',
        'Join volunteers in removing waste from public spaces.',
        'Owo',
        '2026-12-20'
    ),
    (
        'GreenHarvest Growers',
        'Sustainable Farming Workshop',
        'Support a workshop teaching residents environmentally friendly farming methods.',
        'Ondo City',
        '2027-01-10'
    ),
    (
        'GreenHarvest Growers',
        'Community Composting Programme',
        'Help residents learn how to turn organic waste into useful compost.',
        'Akure',
        '2027-01-17'
    ),

    -- UnityServe Volunteers
    (
        'UnityServe Volunteers',
        'Food Donation Drive',
        'Collect and distribute food supplies to families experiencing hardship.',
        'Ondo City',
        '2026-12-07'
    ),
    (
        'UnityServe Volunteers',
        'Children Reading Programme',
        'Volunteer to read with children and encourage literacy.',
        'Owo',
        '2026-12-14'
    ),
    (
        'UnityServe Volunteers',
        'Community Health Outreach',
        'Support a community event promoting health awareness and wellness.',
        'Akure',
        '2026-12-21'
    ),
    (
        'UnityServe Volunteers',
        'Elderly Support Visit',
        'Visit and provide companionship and basic assistance to elderly residents.',
        'Ondo City',
        '2027-01-11'
    ),
    (
        'UnityServe Volunteers',
        'Neighbourhood Volunteer Day',
        'Bring volunteers together to improve shared community spaces.',
        'Owo',
        '2027-01-18'
    )
) AS p(organization_name, title, description, location, project_date)

JOIN organization AS o
    ON o.name = p.organization_name;
