# Field-Checklist

## Proposal Builder

A browser-only tool for the parts of a technical proposal that change with every RFP. **For everyday use, download the single file `proposal-tool/dist/proposal-builder.html` and double-click it** (works in Edge, no install, no admin rights, nothing is uploaded anywhere).

1. **RFP Intake.** Upload the RFP/RFI PDF (or paste text). It finds the required proposal sections, page limits, key dates, evaluation criteria, scope tasks and special requirements (insurance, debarment, separate fee file, and so on), and turns them into an outline and compliance checklist with page budget and status.
2. **Schedule of Work.** Edit tasks and milestones, and the chart updates. Send the RFP's key dates and scope tasks straight into it. Repeat an annual cycle across a multi-year contract.
3. **Experience.** Keep a library of projects, score them against the RFP's keywords, and tick the best fits for the proposal table.
4. **Equipment.** Editable PathRunner description and subsystem list.
5. **Export.** Copy into Word, or download a `.doc`. **Save file** keeps all your edits as a `.json` you can reopen later.

RFP analysis is rule-based and works best on text PDFs. Always check the results against the RFP. Starting project and equipment data comes from the Thurston County draft.

Developers: edit `proposal-tool/index.html` (it loads `lib/pdf.min.js`), then run `python3 proposal-tool/build_single.py` to rebuild the single-file version.

---

# EOD Field Sign-Off (`index.html`)

EOD Field Sign-Off: a daily checklist that runs in the browser. You tap to initial each item, and it prints a PDF summary at the end of the day.

The whole app is one file, `index.html`. It needs no build step, no accounts and no paid hosting.

## Run it locally (free)

You need **Python 3**, which is free. It's already installed on most Macs and Linux machines. On Windows, get it from https://www.python.org/downloads/ and tick "Add Python to PATH" during install.

**Mac / Linux**

```bash
./start.sh
```

**Windows**

Double-click `start.bat`.

Then open **http://localhost:8000** in your browser. Press `Ctrl+C` in the terminal to stop the server.

Other options:
- Use a different port: `./start.sh 3000` or `start.bat 3000`
- No Python but Node.js is installed: the scripts fall back to `npx serve` automatically.
- Run it by hand: `python3 -m http.server 8000`

### Open it on your phone (same Wi-Fi)

The server is reachable from other devices on your network. Find your computer's local IP address (Mac: `ipconfig getifaddr en0`, Windows: `ipconfig`), then on your phone open `http://<that-ip>:8000`.

## Making changes (the iterate loop)

1. Edit `index.html`. The checklist items, styles and logic are all in this one file.
2. Save, then refresh the browser tab. You don't need to restart the server.
3. When you like the result, commit it:
   ```bash
   git add index.html
   git commit -m "Describe the change"
   git push
   ```

## Notes

- Sign-offs are saved in the browser's `localStorage`. They stay on that device and in that browser, and they're separate for `localhost` and any hosted URL.
- Hosting it online later, for example free on GitHub Pages, needs no code changes because `index.html` is already the entry point.
