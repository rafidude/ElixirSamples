defmodule Sender do
  # simulate error
  def send_email("b") do
    :error
  end

  # Assume a heavy process that takes 3 seconds
  def send_email(email) do
    Process.sleep(3000)
    IO.puts("Email to #{email} sent")
    {:ok, "email sent #{email}"}
  end

  def notify_all_blocking(emails) do
    Enum.each(emails, &send_email(&1))
  end

  def notify_all_task_start(emails) do
    Enum.each(emails, fn email ->
      Task.start(fn ->
        send_email(email)
      end)
    end)
  end

  def notify_all_task_async(emails) do
    emails
    |> Enum.map(fn email ->
      Task.async(fn -> send_email(email) end)
    end)
    |> Enum.map(&Task.await/1)
  end

  def notify_all_task_async_stream(emails) do
    emails
    |> Task.async_stream(&send_email/1)
    |> Enum.to_list()
  end

  def notify_all_task_supervisor(emails) do
    Sender.EmailTaskSupervisor
    |> Task.Supervisor.async_stream_nolink(emails, &send_email/1)
    |> Enum.to_list()
  end
end
