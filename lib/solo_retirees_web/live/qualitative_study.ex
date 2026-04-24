defmodule SoloRetireesWeb.QualitativeStudyLive do
  alias SoloRetirees.Surveys.Qualitative
  alias SoloRetirees.Surveys

  import SoloRetireesWeb.CoreComponents
  use Phoenix.LiveView
  use Gettext, backend: SoloRetireesWeb.Gettext

  @impl true
  def mount(_params, _session, socket) do
    Gettext.put_locale("en")

    form =
      %SoloRetirees.Surveys.Qualitative{}
      |> SoloRetirees.Surveys.change_qualitative()
      |> to_form()
      |> IO.inspect()

    {:ok,
     socket
     |> assign(locale: "en")
     |> assign(form: form)
     |> assign(page_title: gettext("Optimizing the Wellbeing of Solo Retirees in Canada"))
     # |> assign(consented: false)
     # |> assign(state: "consent-form")}
     |> assign(consented: true)
     |> assign(gender_other: false)
     |> assign(living_other: false)
     |> assign(state: "consent-form")}
  end

  @impl true
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

  # To have live gettext changes, assign locale to session, then wrap it all in an anonymous function: 
  # <%= Gettext.with_locale(@locale, fn -> %> 
  # <% end) %>
  @impl true
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
        <script>
          fetch("https://hit-counter.fly.dev/api/hit?lang=en", { method: "POST" })
        </script>
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
        <div
          class="qual-survey-container"
          style="
    display: flex;
    flex-direction: column;
    align-items: center;
    width: 100%;
    scroll-behavior: smooth;
        "
        >
          <div
            class="qual-survey"
            style="
    width: 80%;
    max-width: 700px;
    padding-bottom: 2rem;
    padding-top: 2rem;
    background-color: inherit;
          "
          >
            <%= if @state == "consent-form" do %>
              <h1>Solo Retirees: Informed Consent Form</h1>

              <h2>Principal Investigators</h2>
              <p>
                Dr. Wayne Corneil & Dr. Christopher Belanger<br />
                Telfer School of Management & Life Research Institute<br /> University of Ottawa<br />
                <a href="mailto:WCorneil@telfer.uottawa.ca">WCorneil@telfer.uottawa.ca</a>
              </p>

              <h2>Invitation to Participate</h2>
              <p>
                You are invited to participate in the Quality of Life for Solo Retirees conducted by Dr. Wayne Corneil and Dr. Christopher Belanger from the Telfer School of Management and the Life Research Institute at the University of Ottawa.
              </p>

              <h2>Purpose of the Study</h2>
              <p>
                This study will help understand the current quality of life for solo retirees. Results will be compared to results from previous studies using the Canadian Index of Wellness to explore important trends in the quality of life for solo retirees. This will enable to better advocate for retirees’ interests, help to generate knowledge that can be communicated to government agencies and departments to recommend appropriate action, and support scientific research into wellbeing among retirees.
              </p>

              <h2>Participation</h2>
              <p>
                Your participation will consist of writing a description of your experiences as a solo retiree and your well-being.
              </p>

              <h2>Risks</h2>
              <p>
                There are no expected harms or risks except the possible negative feelings that may be associated with reflecting on one’s own health and environment. In the event of distress or discomfort, you may wish to contact your personal physician or access one of the services found at this link:
              </p>

              <p>
                <a
                  target="_blank"
                  href="https://www.iplocation.net/your-guide-to-senior-helplines-in-canada-where-to-find-help"
                >
                  https://www.iplocation.net/your-guide-to-senior-helplines-in-canada-where-to-find-help
                </a>
              </p>

              <h2>Benefits</h2>
              <p>
                Your participation in this study will provide an opportunity to share your experience and perspectives regarding your retirement experience. Your participation will contribute to advancing knowledge about solo retirees in Canada and will provide you with an opportunity to reflect on your own experiences.
              </p>

              <h2>Confidentiality and Anonymity</h2>
              <p>
                The information you share will remain anonymous. No identifiable information about you, such as your name or email address, will be collected. Published research will include aggregated data about responses.
              </p>

              <h2>Conservation of Data</h2>
              <p>
                The data collected will be kept in a secure manner. Electronic files will be stored on a computer with a secure password and paper copies will be in a locked cabinet. Anonymized datasets (e.g. with non-identifiable unique identifiers) will be retained by the principal researchers indefinitely.
              </p>

              <h2>Voluntary Participation</h2>
              <p>
                You are under no obligation to participate and if you choose to participate, you may withdraw at any time prior to the closing date of the data collection without suffering any penalties. Once your contribution is submitted, participants will be unable to withdraw their data as the researchers will be unable to retrace individual datasets.
              </p>

              <h2>Questions</h2>
              <p>
                If you have any questions about the study, you may contact Dr. Corneil. If you have any questions regarding the ethical conduct of this study, you may contact the Protocol Officer for Ethics in Research, University of Ottawa, Tabaret Hall, 550 Cumberland Street, Room 154, Ottawa, ON, K1N 6N5, Tel.: 613-562-5800 ext. 5387 or Email: <a
                  target="_blank"
                  href="mailto:ethics@uottawa.ca"
                >ethics@uottawa.ca</a>.
              </p>

              <p>You should print a copy of the consent form to keep for your personal records.</p>

              <p>
                By clicking the button below, you confirm that you have read and understood the above and that you consent to participate in the research project.  Once you click on this button, you will be taken to a secure web form to write about your experiences.
              </p>

              <p>Thank you for your participation.</p>

              <label>
                <input type="radio" id="consent_button" phx-click="consent" phx-update="ignore" />I Consent
              </label>
              <div style="margin-top: 10px;">
                <button disabled={not @consented} phx-click="button-next"> Next</button>
              </div>
            <% end %>

            <%= if @state == "survey" do %>
              <h1>Canadian Solo Retirees Study</h1>
              <.form
                id="survey-form"
                name="survey-form"
                phx-change="validate"
                phx-submit="button-submit"
                for={@form}
              >
                <div class="qualitative-survey-question">
                  <label for="age">What is your current age?</label>
                  <.input
                    name="age"
                    id="age"
                    type="select"
                    field={@form[:age]}
                    options={[
                      {"--Please choose an option--", ""},
                      {"Under 55", "<55"},
                      {"55-59", "55-59"},
                      {"60-64", "60-64"},
                      {"65-69", "65-69"},
                      {"70-74", "70-74"},
                      {"75-79", "75-79"},
                      {"80-84", "80-84"},
                      {"Over 85", "85"}
                    ]}
                  />
                </div>

                <div class="qualitative-survey-question">
                  <label for="gender">What is your gender?</label>
                  <.input
                    name="gender"
                    id="gender"
                    type="select"
                    field={@form[:gender]}
                    options={[
                      {"--Please choose an option--", ""},
                      {"Woman", "Woman"},
                      {"Man", "Man"},
                      {"Non-Binary", "NonBinary"},
                      {"Gender Diverse", "GenderDiverse"},
                      {"I use different language to self-identify.", "DifferentLanguage"},
                      {"I prefer not to say", "PreferNotSay"}
                    ]}
                  />
                </div>

                <div :if={@gender_other} class="qualitative-survey-question">
                  <label for="gender_other">Option to specify your gender:</label>
                  <.input
                    :if={@gender_other}
                    name="gender_other"
                    id="gender_other"
                    type="text"
                    field={@form[:gender_other]}
                  />
                </div>

                <div class="qualitative-survey-question">
                  <label for="province">
                    In which province or territory do you officially reside?
                  </label>
                  <.input
                    name="province"
                    id="province"
                    type="select"
                    field={@form[:province]}
                    options={[
                      {"--Please choose an option--", ""},
                      {"British Columbia", "BC"},
                      {"Alberta", "AB"},
                      {"Saskatchewan", "SK"},
                      {"Manitoba", "MB"},
                      {"Ontario", "ON"},
                      {"Québec", "QC"},
                      {"New Brunswick", "NB"},
                      {"Nova Scotia", "NS"},
                      {"Newfoundland and Labrador", "NFL"},
                      {"Prince Edward Island", "PEI"},
                      {"Yukon", "YK"},
                      {"Northwest Territories", "NWT"},
                      {"Nunavut", "NV"}
                    ]}
                    errors={["oh no???"]}
                  />
                </div>

                <div class="qualitative-survey-question">
                  <label for="living_situation">
                    Which <em>one</em>
                    of the following  best describes your current living arrangements?
                  </label>
                  <.input
                    name="living_situation"
                    id="living_situation"
                    type="select"
                    field={@form[:living_situation]}
                    options={[
                      {"--Please choose an option--", ""},
                      {"Living alone, widowed", "widowed"},
                      {"Living alone, divorced/separated", "divorced"},
                      {"Living alone, never married", "nevermarried"},
                      {"Living alone, have partner living in another place", "alonepartnered"},
                      {"Living with immediate family members (e.g. child, sibling)",
                       "immediatefamily"},
                      {"Living with extended family members (e.g. cousins, uncles, aunts)",
                       "extendedfamily"},
                      {"Living with others in a private home (e.g. unrelated adults)", "privatehome"},
                      {"Living with others in a retirement residence or long-term care facility",
                       "ltc"},
                      {"Living together, apart (i.e., share home, but no longer in an intimate relationship)",
                       "togetherapart"},
                      {"Other", "other"}
                    ]}
                  />
                </div>

                <div :if={@living_other} class="qualitative-survey-question">
                  <label for="living_situation_other">
                    Option to specify your living situation:
                  </label>
                  <.input
                    name="living_situation_other"
                    id="living_situation_other"
                    type="text"
                    field={@form[:living_situation_other]}
                  />
                </div>

                <div class="qualitative-survey-question">
                  <label for="freetext">
                    What would you like to tell the research team about your experience as a solo retiree?
                    <em>Please note that your results will not be saved until you click "Submit."</em>
                  </label>
                  <.input id="freetext" name="freetext" type="textarea" field={@form[:freetext]} />
                </div>

                <button>Submit</button>
              </.form>
            <% end %>

            <%= if @state == "thanks" do %>
              <h1>Thank you!</h1>
              <p>Your results have been recorded.</p>
              <p><a href="/">Click here to return to the main page.</a></p>
            <% end %>
          </div>
        </div>
      </body>
    <% end) %>
    """
  end

  def handle_event("change_locale", _unsigned_params, socket) do
    locale = Gettext.get_locale()
    IO.inspect(locale, label: "locale")
    new_locale = if locale == "en", do: "fr", else: "en"
    IO.inspect(new_locale, label: "new_locale")

    {
      :noreply,
      socket
      |> push_patch(to: "/survey?locale=#{new_locale}")
    }
  end

  @impl true
  def handle_event("consent", _unsigned_params, socket) do
    {:noreply, assign(socket, consented: true)}
  end

  @impl true
  def handle_event("button-next", _unsigned_params, socket) do
    {:noreply, assign(socket, state: "survey")}
  end

  @impl true
  def handle_event("button-submit", params, socket) do
    result = Surveys.create_qualitative(params) |> IO.inspect()

    case result do
      {:ok, _qualitative} ->
        {:noreply, assign(socket, state: "thanks")}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign(socket, form: to_form(changeset))}
    end
  end

  @impl true
  # def handle_event("validate", %{"qualitative" => params}, socket) do
  def handle_event("validate", params, socket) do
    form =
      %Qualitative{}
      |> Surveys.change_qualitative(params)
      |> to_form(action: :validate)

    socket =
      if params["gender"] == "DifferentLanguage" do
        assign(socket, gender_other: true)
      else
        assign(socket, gender_other: false)
      end

    socket =
      if params["living_situation"] == "other" do
        assign(socket, living_other: true)
      else
        assign(socket, living_other: false)
      end

    {:noreply, assign(socket, form: form)}
  end
end
