defmodule SoloRetireesWeb.SoloRetireesLive do
  use Phoenix.LiveView

  use Gettext, backend: SoloRetireesWeb.Gettext

  def mount(_params, _session, socket) do
    Gettext.put_locale("en")

    {:ok,
     socket
     |> assign(locale: "en")
     |> assign(page_title: gettext("Optimizing the Wellbeing of Solo Retirees in Canada"))}
  end

  def handle_params(params, _uri, socket) do
    IO.inspect(params)

    locale =
      params
      |> Map.get("locale", "en")

    #   |> Map.merge(%{"locale" => "en"})
    IO.inspect(locale, label: "handle_params locale")

    Gettext.put_locale(locale)

    {:noreply,
     socket
     |> assign(locale: locale)
     |> assign(page_title: gettext("Optimizing the Wellbeing of Solo Retirees in Canada"))}
  end

  def handle_event("change_locale", _unsigned_params, socket) do
    locale = Gettext.get_locale()
    IO.inspect(locale, label: "locale")
    new_locale = if locale == "en", do: "fr", else: "en"
    IO.inspect(new_locale, label: "new_locale")

    {
      :noreply,
      socket
      |> push_patch(to: "/?locale=#{new_locale}")
    }
  end

  # To have live gettext changes, assign locale to session, then wrap it all in an anonymous function: 
  # <%= Gettext.with_locale(@locale, fn -> %> 
  # <% end) %>
  def render(assigns) do
    ~H"""
    <%= Gettext.with_locale(@locale, fn -> %>
      <head>
        <link rel="icon" href="images/favicon.png" />
        <title>{gettext("Optimizing the Wellbeing of Solo Retirees in Canada")}</title>
        <meta name="viewport" content="width=device-width, initial-scale=1" />
        <meta
          name="description"
          content="The Canadian Study on the Wellbeing of Solo Retirees (CSRS) is a research project to optimize the wellbeing of solo retirees in Canada by investigating the wants, needs, and experiences of older retired Canadians living alone. The CSRS is run out of the Life Research Institute and University of Ottawa."
        />
        <link href="style.css" rel="stylesheet" />
      </head>

      <header class="header">
        <div class="header-text desktop">
          {gettext("Optimizing the Wellbeing of Solo Retirees in Canada")}
        </div>
        <div class="header-text mobile">
          {gettext("Optimizing the Wellbeing of Solo Retirees in Canada")}
        </div>

        <div class="header-text">
          <a href="#" phx-click="change_locale" class="header-text lang-link">
            {gettext("Français")}
          </a>
        </div>
      </header>

      <body>
        <div id="hero" style="background-image: url('images/hero-flowers.webp');">
          <div class="hero-content">
            <h1>
              {gettext("Optimizing the Wellbeing of Solo Retirees in Canada")}
            </h1>
            <p class="hero-subtitle">
              {gettext("A Project by the Life Research Institute and the University of Ottawa")}
            </p>
            <div class="hero-nav-links">
              <a href="#about-study" class="mobile">{gettext("About")}</a>
              <a href="#about-study" class="desktop">{gettext("About the Project")}</a>
              <a href="#eligibility">{gettext("Eligibility")}</a>
              <a href="#how-to-participate">{gettext("How to Participate")}</a>
              <a href="#about-team" class="mobile">{gettext("The Team")}</a>
              <a href="#about-team" class="desktop">{gettext("About the Team")}</a>

              <a href="#contact">{gettext("Contact")}</a>
            </div>
          </div>
        </div>

        <div class="section" id="about-study">
          <div class="section-content">
            <h2>{gettext("About the Project")}</h2>
            <p class="section-description">
              {gettext(
                "The Life Research Institute at the University of Ottawa is launching an innovative project to enhance the quality of life and optimize the wellbeing of solo retirees."
              )}
              <em>
                {gettext(
                  " A solo retiree is someone who has never married/partnered, is separated, divorced, or widowed, or is currently living apart from a partner and has retired or is nearing retirement."
                )}
              </em>
            </p>
            <p class="section-description">
              {gettext(
                "The first step is a national, bilingual study followed by the release of findings
              and evidence-based resources."
              )}
            </p>
            <p class="section-description">
              <b>{gettext("The survey is now closed.")}</b>
            </p>
          </div>
          <!--        <div class="decorative-bottom-tab"></div> -->
        </div>

        <div class="section" id="survey-closed">
          <div class="section-content">
            <h2>{gettext("The Survey is Now Closed")}</h2>
            <p class="section-description">
              <b>
                {gettext(
                  "Thank you to all the participants who took the time to fill out the survey!"
                )}
              </b>
              {gettext("The survey is now closed and we are hard at work analyzing the data.")}
            </p>
          </div>
          <!--        <div class="decorative-bottom-tab"></div> -->
        </div>

        <div class="section" id="share-your-story">
          <div class="section-content">
            <h2>{gettext("Share Your Story")}</h2>
            <p class="section-description">
              {gettext(
                "Although the survey is closed, you can still share your story with us if you:"
              )}
              <ul>
                <li>
                  {gettext("Are retired (or are soon to be retired) and solo as described above, and")}
                </li>
                <li style="padding-top: 0.5em">
                  {gettext("Have a primary residence in Canada, and")}
                </li>
                <li style="padding-top: 0.5em">
                  {gettext("Are willing to share your experiences through an online questionnaire.")}
                </li>
              </ul>
            </p>
            <!--        <div class="decorative-bottom-tab"></div> -->

            <p class="section-description">
              {gettext(
                "All information provided during the study will remain confidential and will be used only for research purposes. The study follows the University of Ottawa’s strict ethical guidelines to ensure your privacy and safety throughout."
              )}
            </p>
          </div>
        </div>
        <!--
      <div class="section" id="how-to-participate">
        <div class="section-content">
          <h2>How to Participate</h2>
          <p class="section-description">
            <b>Your contribution</b>
            to this important work requires you to...
            <ul>
              <li>Complete an online survey.</li>
              <li style="padding-top: 0.5em">
                Be prepared to spend about 45 minutes answering all the questions.
              </li>
              <li style="padding-top: 0.5em">
                Complete the survey in one sitting, or pause and resume as often as you like, as
                long as you use the same device (computer, tablet, or phone) each time you log on. Each time you log in, you
                will pick up from where you left off previously.
              </li>
              <li style="padding-top: 0.5em">
                Remember, you can change your mind and quit at any time, no questions asked!
              </li>
            </ul>
          </p>
          <p class="section-description">To take the survey, please click on this link:</p>
          <a
            id="survey-a"
            href="https://uwaterloo.ca1.qualtrics.com/jfe/form/SV_0Ijq06KORZ7F92e"
            target="_blank"
          >
            <div id="survey-button">Participate in the Solo Retiree Survey</div>
          </a>
          <p>
            PLEASE NOTE: this is a long questionnaire that could take 45 minutes to complete. However, it has AUTOSAVE. That
            means you can do a section and leave it. You can come back at
            <span class="ital-ul">any time using the same
              device</span>
            to do more
            sections.
          </p>
          <p>
            We appreciate your patience in completing the questionnaire as all of this information is vital to understanding
            the experiences of solo retirees.
          </p>
        </div>
        <div class="decorative-bottom-tab"></div>
      </div>
    -->
        <div class="section" id="faq">
          <div class="section-content">
            <h2>Frequently Asked Questions</h2>

            <h3>Who are Canada’s solo retirees?</h3>
            <ul>
              <li>
                <p class="section-description">
                  There are many ways to be a solo retiree and no two situations will look the same. In the Canadian Study on the Wellbeing of Solo Retirees, a solo retiree is someone who has never married/partnered, is separated, divorced, or widowed, or is currently living apart from a partner and has retired or is nearing retirement. This could be someone living alone, in a congregate living situation, or even with extended family.
                </p>
              </li>
            </ul>

            <h3>How much does Canada know about its solo retirees?</h3>
            <ul>
              <li>
                <p class="section-description">
                  Canada knows very little about its solo retirees and there is virtually no data about this community. The Canadian Study on the Wellbeing of Solo Retirees is designed to hear the voices of this often ignored and misunderstood group and to better understand their needs and wellbeing.
                </p>
              </li>
            </ul>

            <h3>What is the difference between a “single retiree” and a “solo retiree?”</h3>
            <ul>
              <li>
                <p class="section-description">
                  Being solo is not the same thing as being single! Someone can be living solo and still have deep and meaningful relationships, including romantic relationships. A solo retiree is someone who has never married/partnered, is separated, divorced, or widowed, or is currently living apart from a partner and has retired or is nearing retirement. An important part of the Canadian Study on the Wellbeing of Solo Retirees will be exploring what connects Canadian retirees who self-identify as solo.
                </p>
              </li>
            </ul>

            <h3>Does “retiring alone” mean “retiring lonely?”</h3>
            <ul>
              <li>
                <p class="section-description">
                  Retiring alone does not mean retiring lonely, and anecdotally many solo retirees have rich and meaningful social connections. However, because solo retirees have often been overlooked by researchers, little is known about this community’s needs and overall wellbeing. The Canadian Study on the Wellbeing of Solo Retirees is designed to learn more about this community and its experiences.
                </p>
              </li>
            </ul>

            <h3>I am a solo retiree, how can I feel more connected to my community?</h3>
            <ul>
              <li>
                <p class="section-description">
                  Staying connected can be more challenging for people living solo, especially as the weather outside turns cold and dark. Some suggestions could include connecting with community organizations like the Men’s Shed or faith groups, volunteering for worthy causes like a local food bank or animal shelter, or finding local groups organized around a shared interest like photography or literature.
                </p>
              </li>
            </ul>
          </div>
        </div>

        <div class="section" id="about-team">
          <div class="section-content">
            <h2>{gettext("About the Team")}</h2>
            <div class="bio">
              <h3>{gettext("Dr. Wayne Corneil")}</h3>
              <ul>
                <li>
                  <p class="section-description">
                    {gettext(
                      "Dr. Corneil is an Adjunct Professor in the Telfer School of Management and a researcher with the LIFE
                    Research Institute at the University of Ottawa. His research focuses on psychosocial interventions and
                    on individual and organizational resilience. Dr. Corneil provides consulting to public and private
                    sector organizations on mental health in the workplace, creating psychologically safe workplaces,
                    resilience, psychosocial preparation for retirement, and crisis leadership. Dr. Corneil has doctorate in
                    Epidemiology and Occupational Health Psychology from the Johns Hopkins University and has professional
                    degrees in psychotherapy, social work, criminology, and adult education."
                    )}
                  </p>
                </li>
              </ul>
            </div>

            <div class="bio">
              <h3>Dr. Christopher Belanger</h3>
              <ul>
                <li>
                  <p class="section-description">
                    {gettext(
                      "Dr. Belanger is an Adjunct Professor at the University of Ottawa where his research interests include
                    health geography and access to healthcare, especially for older Ontarians and French-language speakers.
                    Dr. Belanger completed postdoctoral studies with the University of Ottawa and the Institut du Savoir
                    Montfort researching geospatial access to language-concordant primary care and digital health. He holds a
                    PhD in the Philosophy of Modern Physics (2015) and a BSc Hon. in Physics (2007), both from the University
                    of Toronto, an MBA from the University of Ottawa’s Telfer School of Management."
                    )}
                  </p>
                </li>
              </ul>
            </div>

            <div class="bio">
              <h3>Dr. Bryan Smale</h3>
              <ul>
                <li>
                  <p class="section-description">
                    {gettext(
                      "Director of the Canadian Index of Wellbeing (CIW) housed in the Faculty of Health at the University of
                    Waterloo (UW), Professor Emeritus in the Department of Recreation and Leisure Studies and cross-appointed
                    to the Department of Geography and Environmental Management. He received his Ph.D. in Geography from the
                    University of Western Ontario and both his Master’s and B.A. in Leisure Studies from the University of
                    Waterloo. His research focuses on the wellbeing of individuals and communities, the role of leisure in
                    wellbeing, the spatial distribution and analysis of leisure in communities, time use allocation, and
                    social indicators research. He was elected a Fellow to the Academy of Leisure Sciences, awarded the Hall
                    of Heroes Leadership Award by the Community Indicators Consortium, and the Outstanding Contribution to
                    Leisure Studies Award by the Canadian Association of Leisure Studies."
                    )}
                  </p>
                </li>
              </ul>
            </div>
            
    <!--
            <div class="bio">
              <h3>Dr. Steven E. Mock</h3>
              <ul>
                <li>
                  <p class="section-description">
                    Associate professor in the Department of Recreation and Leisure Studies at the University of Waterloo. He
                    received his PhD in developmental psychology at Cornell and held postdoctoral positions at Lighthouse
                    International in New York City and the Yale School of Management. Dr. Mock's research interests are in the
                    areas of aging and retirement, coping with stigmatization, sexual minority adult development, and leisure
                    as a coping resource.
                  </p>
                </li>
              </ul>
            </div>
    -->
            <div class="bio">
              <h3>Suzanne Nault</h3>
              <ul>
                <li>
                  <p class="section-description">
                    {gettext(
                      "Throughout her career, as an executive coach, psychologist, speaker and author, Suzanne has focused on
                    helping individuals navigate transitions in their lives. She is a well-sought speaker on the transition to
                    retirement and has offered over 7,000 seminars on the psychological aspects to retirement. Suzanne is
                    certified as a professional integral coach by New Ventures West, California, and the International
                    Coaching Federation, in Conversational Intelligence™, Story Coaching™ and Navigating Transitions Coaching.
                    She is a licensed psychologist with Ordre des psychologues du Québec. Her academic background includes a
                    Master’s degree in clinical psychology (University of Ottawa), a B.A. in psychology (University of
                    Ottawa).
    "
                    )}
                  </p>
                </li>
              </ul>
            </div>

            <div class="bio">
              <h3>Nora Spinks</h3>
              <ul>
                <li>
                  <p class="section-description">
                    {gettext(
                      "Nora Spinks, CEO of Work-Life Harmony, is one of Canada’s leading experts in well-being and quality of
                    life. She is a member of the Canadian Wellbeing Knowledges Network’s leadership team, bringing together
                    professionals from multiple sectors to enhance understanding of well-being. She has worked with several
                    federal government departments on quality of life and well-being, including Statistics Canada’s Social
                    Conditions Committee and Quality-of-Life Hub, Finance Canada’s Canadian Quality of Life Framework, chair
                    of the National Seniors Council advising the Ministers of Health and Seniors on quality of life of seniors
                    and how to alleviate the challenges people face in retirement. She continues to work with academics and
                    scholars on tri-council-funded projects, including ones led by U of Ottawa, McGill U., Memorial U.,
                    McMaster U., Brock U, and Queens U."
                    )}
                  </p>
                </li>
              </ul>
            </div>
          </div>
          <!--        <div class="decorative-bottom-tab"></div> -->
        </div>
        
    <!-- <div class="section" id="comms"> -->
          <!-- <div class="section-content"> -->
            <!-- <h2>Media Kit</h2> -->
            <!-- <p class="section-description"> -->
              <!-- To download text and images that can be used to promote the study, please click here: -->
            <!-- </p> -->

            <!-- <p> -->
              <!-- <a href="mediakit.html"> -->
              <!-- View Media Kit -->
              <!-- </a> -->
            <!-- </p> -->

          <!-- </div> -->
        <!-- </div> -->

        <div class="section" id="contact">
          <div class="section-content">
            <h2>Contact</h2>
            <p class="section-description">
              {gettext(
                "To participate or learn more about the study, please contact our Primary Investigator:"
              )}
            </p>

            <p>
              <a class="mail-link" href="mailto:wayne.corneil@telfer.uottawa.ca">
                <svg
                  fill="currentColor"
                  height="30px"
                  width="30px"
                  version="1.1"
                  id="Layer_1"
                  xmlns="http://www.w3.org/2000/svg"
                  xmlns:xlink="http://www.w3.org/1999/xlink"
                  viewBox="0 0 330.001 330.001"
                  xml:space="preserve"
                >
                  <g id="SVGRepo_bgCarrier" stroke-width="0" />
                  <g id="SVGRepo_tracerCarrier" stroke-linecap="round" stroke-linejoin="round" />
                  <g id="SVGRepo_iconCarrier">
                    <g id="XMLID_348_">
                      <path
                        id="XMLID_350_"
                        d="M173.871,177.097c-2.641,1.936-5.756,2.903-8.87,2.903c-3.116,0-6.23-0.967-8.871-2.903L30,84.602 L0.001,62.603L0,275.001c0.001,8.284,6.716,15,15,15L315.001,290c8.285,0,15-6.716,15-14.999V62.602l-30.001,22L173.871,177.097z"
                      />
                      <polygon id="XMLID_351_" points="165.001,146.4 310.087,40.001 19.911,40 " />
                    </g>
                  </g>
                </svg>
                Dr. Wayne Corneil
              </a>
            </p>
          </div>
        </div>

        <div style="background-color:white; display:flex; flex-direction: row; justify-content: center; flex-wrap: wrap;">
          <span>
            <img
              src="images/logo-small.png"
              class="bottom-logo"
              width="300px"
              height="60px"
              alt="LIFE Institut de recherche et l'Université d'Ottawa"
            />
          </span>
          <span style="padding-left:5px;">
            <img
              src="images/nafr-logo-small.png"
              alt="National Association of Federal Retirees / Association nationale des retraités fédéraux"
            />
          </span>
        </div>
      </body>
    <% end) %>
    """
  end
end
