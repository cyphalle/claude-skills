---
name: writing-voice
description: "Doctrine for anything an agent writes into a team channel: GitHub comments, issue and PR bodies, chat messages, wiki pages. Two text surfaces (human vs agent), length caps by reply vs deposit, register indexed on the act asked of the reader, banned idioms. Load before writing to any external channel."
---

# writing-voice

The single source for tone, format and length of what an agent writes outside the chat:
GitHub comments, issue and PR bodies, chat messages, wiki pages.

Every rule below is backed by a measurement. A rule that proves untenable is revised by
measuring again. Argument alone does not change a rule.

## 0. Two text surfaces: who reads?

Before you write anything, ask who reads it. The two regimes carry opposite instructions,
and choosing the wrong one costs in both directions.

**Addressed to a human**: an issue or PR body, a thread comment, a chat message, a wiki
page. Someone must decide something after reading. The caps below apply.

**Addressed to an agent**: a spec, an implementation plan, workstream context. The
instruction is the reverse: **be generous**. Write the edge cases, the constraints that
look obvious, the table names, the payload shapes, what you ruled out and why. An agent
has no intuition to fill a gap. Every silent assumption becomes a decision it takes alone
and badly, and that only shows three PRs later.

**Both live in one artefact.** The essentials readable in 90 seconds on top, then the
agent context in a `<details>` block whose summary says it is written for agents. GitHub
folds it: the human sees the essentials, the agent reads everything, nothing is cut. When
that context overflows, it goes to a versioned file in the repository.

## 1. Length: two regimes

The defect is not an absolute length. It is a ratio: a 6 000-character reply to a
1 336-character message is 4.5 times longer. On one measured sample of 44 comments, the
team median was about 1 200 characters, and the only legitimately long comments were
deposited artefacts (audits, build statuses). None was a reply in a thread.

### REPLY: there is a message in front of you

| Channel | Cap |
|---|---|
| GitHub comment in a thread | 500 characters, and never more than 1.5 times the message it answers |
| Chat message | 600 characters (about 5 lines) |
| Wiki comment | 800 characters |

### DEPOSIT: you write an artefact, nobody waits for a reply

| Channel | Cap |
|---|---|
| Issue or PR body | 1 500 characters above the `<details>`, unlimited below |
| GitHub artefact comment (audit, status) | 4 000 characters |
| Wiki page | no length cap, a cap on the top of the page (see §5) |
| Chat report (weekly release, briefing) | parent message 600 characters, the rest in thread |

The parent message of a chat report carries the verdict. An execution status alone tells the reader nothing. One
run once produced a mute parent (`review done, exit 0, 18m18s`) with all the content
buried in the thread. The content was good. It was not readable where it had to be.

### Over the cap: the verdict stays, the reasoning moves

Never cut information. Move it. In the thread: the conclusion, what changes for the
reader, the question asked. Elsewhere (a body section, a `<details>` block, a page): the
table, the evidence, the rejected alternatives.

**A cap is a test to pass again.** If a first version is over, rewrite
it before showing it. Never ask whether the user wants the short version.

### The test before sending

1. Which regime? A message in front of you: REPLY. Otherwise: DEPOSIT.
2. Does it fit the cap? If not, what moves to a linked artefact?
3. Does the reader need all of this to act? What changes neither their decision nor their
   next move does not belong in the thread.

## 2. Register: indexed on the act asked of the reader

Measured: comments did not vary by recipient. The same person received 700 to 3 500
characters, with the same density. Length followed the topic. The reader had no effect. So the
register is indexed on the act, because the same person changes role during a day.

| Act | What the message carries | Target |
|---|---|---|
| RATIFY | the choice, the rejected alternative, the reason in one line. No demonstration. Ends with "ratify or correct" | ~600 c |
| DECIDE | the problem, two options, your recommendation. An explicit question, a named owner | ~1 000 c |
| EXECUTE | what, where, which constraint. Imperative. No justification: it is in the issue | ~400 c |
| KNOW | factual. No request, no bold | ~300 c |

These are targets. The caps of §1 stay the absolute maximum. An EXECUTE message of
1 500 characters meets the cap and misses the register.

**The first line states the act before any context.** No greeting word on any channel: no
"hey", no first name, no formula. The reader knows the message is for them.

```
no:  Hi, following our discussion on Y, I assigned you #123...
yes: I assigned you #123, in To dev, This week.
```

**Mentioning someone is asking a question**, written next to the name. If nothing is
expected, write `FYI`: it says that not reading is an option. A review request is never an
FYI: being a reviewer commits you to answer within a working day.

### When you disagree with an owner

What is yours, you settle: a verifiable state of the code, a figure, a measurement, a
contradiction with a written decision (quote it, do not interpret it).

What is not yours, you name without settling: the domain judgment itself. State the
objection, say where it gets decided, and stop.

Fact first, objection second. A verified fact is not posed as a question: "does your
reading change once X is integrated?" is false politeness when X is measured. State the
correction, then ask whether it changes the reading.

## 3. Language

Pick one language per surface and write it down. Never mix two languages in one artefact:
an English body with a section in another language, or a thread that switches halfway, is
the real defect.

**Verbatims are never translated.** A customer quote, a call extract, an error message, a
reviewer comment keep their original language, even inside a body in another language. A
translated verbatim is a paraphrase, and a paraphrase proves nothing.

## 4. Idioms and typography

Measured on about 41 000 characters of comments: one bold pair every 286 characters, one
em dash every 297 characters, an average sentence of 138 characters. Bold and dashes at
that frequency make one typographic marker per sentence. Neither signals anything anymore.

### The em dash is banned

Two sentences instead, always.

```
no:  was never decided — it is still open
yes: was never decided. It is still open.
```

Why a ban and not a quota: every occurrence was the same gesture, an explanatory aside
grafted at the end of a sentence. It is a sentence that refuses to stop. Cutting it treats
the cause, and shortens the average sentence mechanically. The en dash in a range
(`5–50 km`), the colon and the parenthesis stay available.

### Bold: one per 800 characters

Three times less than measured. In a 1 500-character message, that is two at most.
Emphasis inside a paragraph comes from word order.

### The balanced "X, not Y" structure is banned

It sets up a distinction in six words, and that is exactly what makes it irresistible: it
feels like a decision without having to show one. Repeated, it reads as a formula, and the
reader stops seeing a distinction.

```
no:  It is a screening, not the analysis.
yes: This screen screens. The next one prices.

no:  Reassigning is a swap, never an addition.
yes: Reassigning removes the old assignee and adds the new one, in the same command.
```

A plain "not" in an ordinary sentence stays available. What is banned is the seesaw: a
statement whose second half negates the first.

### Three signature idioms, used on purpose

1. **The number instead of the adjective.** "Comments are often too long" becomes
   "one bold every 286 characters, against one per 800 targeted".
2. **The verified fact in a table.** To correct a state of affairs: two columns, "what is
   said" against "what is true", each row citing its source (a commit, a date, a
   measurement). Six lines nobody can argue with replace three paragraphs of argument.
3. **"Ratify or correct".** Never "is that OK for you?", which asks for a permission you
   do not need.

## 5. Wiki pages

A wiki page is rarely a conversation. It publishes a report, read diagonally, one to three
weeks later, by someone who was not in the conversation.

1. **The page opens on the verdict.** The first three lines say what to retain and what
   must change. How the data was collected comes last, or nowhere.
2. **The scope is dated at the top**: which period, which source, frozen when. A page
   without this header becomes unreadable in three weeks, and worse, stays quotable while
   its numbers have moved.
3. **No length cap, a cap on the top of the page**: verdict, dated scope, and a table of
   contents beyond four sections.

**If someone must act on it, it is an issue.** A page that ends with a to-do list without
owners is a ghost backlog. Create the issues and link them from the page.
