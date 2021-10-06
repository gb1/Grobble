defmodule GrobbleWeb.TailLive do
  use GrobbleWeb, :live_view

  @impl true
  def mount(_params, _session, socket) do
    {:ok, socket}
  end

  @impl true
  def render(assigns) do
    ~H"""
    <body class="bg-gray-100 sm:bg-yellow-300 md:bg-green-400 lg:bg-pink-400 xl:bg-purple-400">
    <div class="px-8 py-12 max-w-md mx-auto">
      <img class="h-10" src="https://raw.githubusercontent.com/tailwindlabs/tailwindcss-from-zero-to-production/main/02-the-utility-first-workflow/img/logo.svg"/>
      <img class="mt-6 rounded-lg shadow-xl" src="https://github.com/tailwindlabs/tailwindcss-from-zero-to-production/blob/main/02-the-utility-first-workflow/img/beach-work.jpg?raw=true"/>

      <h1 class="mt-6 text-2xl font-bold text-gray-900">You can work from anywhere. <span class="text-indigo-500">Take advantage of it</span></h1>

      <p class="mt-2 text-gray-600">
      Workcation helps you find work-friendly rentals in beautiful locations so you can enjoy some
      nice weather even when you're not on vacation.
      </p>

        <div class="mt-4">
          <a class="bg-indigo-500 text-white px-4 py-2 inline-block rounded-lg shadow-lg uppercase tracking-wide font-semibold" href="#">Book your escape</a>
        </div>
      </div>
    </body>
    """
  end
end
